# Configure the AWS Provider
provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-west-2"
}

resource "aws_instance" "epjtarget" {
    ami = "${lookup(var.amis, var.region)}"
    instance_type = "t2.micro"
    associate_public_ip_address = "true"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${var.security_groups.launch-wizard-1}", "${var.security_groups.adamd-basic}"]
    connection={
       host = "${self.private_ip}"
       user="ubuntu"
       key_file="${var.aws_key_file_path}"
    }

    provisioner "remote-exec" {
      inline = [
       "export PATH=$PATH:/usr/bin",
       "sudo apt-get update"
      ]
    }
       provisioner "local-exec" {
          command = "ansible-playbook /home/ubuntu/epjbuild/ansible/main.yml -i ${self.private_ip}, -u ubuntu --private-key=${var.aws_key_file_path} --extra-vars='target=all'"
       }
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.epjtarget.id}"
    depends_on = ["aws_instance.epjtarget"]
}

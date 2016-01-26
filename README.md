# terransible_test1

This is my first set of successful terraform plans and ansible playbooks to create a server, upgrade and provision that server, and populate it with a sample website from my repo.

I'll continue to build on this to get it to build further infrastructure.

Still to be done:

- Route53 dns changes once the site is deployed.
- DB server
- Proof of db connectivity
- Process for site re-deploy once it's built and set up the first time.

All of this is done while ssh'd into a control server which in turn will communicate with AWS to create the new server, provision it, and deploy the website.

##Before using this repo

It is assumed you will have created a new control server and provisioned it with:

- Python
- Git
- AWS client
- Ansible

Once that is done, you can test out this repo.

Here is how to use this repo

Clone / fork all files.

## Terraform

Edit the following files:

```
key_prive/sample.pem
```

Copy your existing / functioning pem file to this location.

```
terraform_workspace/terraform.tfvars
```

Edit this file to include your actual AWS connection credentials.

The key pair name should be an existing keypair in use within your aws account for connecting to servers that are up and running.

Do not re-commit these files back into the repo. This info is very, very dangerous to share with the open internet. Don't do that! :)

## Ansible

I have this set up to deploy an existing site from my own repo. You should replace it with one of your own. Do this by editing:

```
epjbuild/ansible/main.yml
```

Line #9 features the repo url.

```
epjbuild/ansible/deploy-user/files/
deployment_key.rsa
deployment_key.rsa.pub
```

Your actual private and public key values should replace these.

Once everything is configured:

```terraform plan```

If there are no errors:

```terraform apply```

When ansible starts running the playbook, you will need to type "yes" at a specific prompt. There are ways to configure ansible but that's not the purpose of this experiment.

Wait for it to complete. Watch your aws EC2 instances console. You should see a new instance getting started up. You should then also see the ansible playbook getting run and the server get provisioned. Make note of the new ip address so you can ssh onto that box and verify the web server has been installed.

This is just a starter setup, but from here you can customize any setup you like.

To get rid of the server and its entire setup:

```terraform destroy```

ad / Jan 2016

# terransible_test1

This is my first set of successful terraform plans and ansible playbooks to create a server, upgrade and provision that server, and populate it with a sample website from my repo.

I'll continue to build on this to get it to build further infrastructure.

Still to be done:

- Route53 dns changes once the site is deployed.
- DB server
- Proof of db connectivity
- Process for site re-deploy once it's built and set up the first time.

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



# Packer - introduction

What is Packer?

> Packer is easy to use and automates the creation of any type of machine image. It embraces modern configuration management by encouraging you to use a framework such as Chef or Puppet to install and configure the software within your Packer-made images.
>
>    -- from www.packer.io/intro/why.html

 
## Setup 

Download static binary from https://www.packer.io/downloads.html

Verify installation by running:

    packer version
    
    
**Troubleshooting:**  On some RedHat-based Linux distributions there is
nother tool named `packer` installed by default. Check by
 
    which -a packer

## First build 

Run first build on `amazon-ebs` builder.
 

Validate build template:

    packer validate basic-image.json
       
Run build from template:

    packer build basic-image.json
    
Run build with variables:

    packer build -var-file=variables.json basic-image.json

### AWS build workflow:

* Create temporary KeyPair
* Create EC2 Instance (optionally spot one)
* Provision the machine by running some commands
* Save machine as image


# Packer build blocks

## Templates

Templates are files that configure the various components of Packer in
order to create one or more machine images.

Until Packer configuration files was JSON only. Packer 1.5 is able
to read tempaltes in HCL2 format. JSON templates are still supported.
 

# Links

Links: EBS builder https://www.packer.io/docs/builders/amazon-ebs.html


# terraform--basics

This repository contains all the basics that are needed to kickStart terraform-learning.



### what is terraform ?  Why we need it ? Why companies prefer terraform ? 

```
    Terraform is an open-source infrastructure as code (IaC) tool developed by HashiCorp. It allows users to define and provision infrastructure using a declarative configuration language. With Terraform, you can describe your desired infrastructure in code, and then use Terraform to create, modify, and manage that infrastructure in a consistent and automated way.

   >  Here are some key aspects of Terraform and reasons why companies adopt it:

       *  Infrastructure as Code (IaC): Terraform enables the practice of treating infrastructure as code. Infrastructure configurations are written in a human-readable language, allowing teams to version, share, and manage infrastructure code alongside application code. This brings the benefits of version control, collaboration, and code review to infrastructure management.

      *  Declarative Configuration: Terraform uses a declarative approach, meaning you specify the desired state of your infrastructure, and Terraform takes care of figuring out how to achieve that state. This simplifies the process of provisioning and managing infrastructure, as users don't need to worry about the sequence of operations or low-level details.

      *  Multi-Cloud and Hybrid Cloud Support: Terraform supports a wide range of cloud providers (such as AWS, Azure, Google Cloud Platform, and others), as well as on-premises and hybrid cloud environments. This allows organizations to use a consistent tool and configuration across different cloud providers or their own data centers.

      *  Consistency and Reproducibility: Terraform ensures that the infrastructure deployed in different environments (development, staging, production) remains consistent. This reduces the likelihood of configuration drift and makes it easier to reproduce environments reliably.

      *  Automation and Efficiency: Terraform automates the provisioning and management of infrastructure, reducing the manual effort involved. This leads to increased efficiency, faster deployment cycles, and the ability to scale infrastructure as needed.

      *  Collaboration and Teamwork: Terraform facilitates collaboration among teams by providing a shared language for infrastructure. Teams can work on different parts of the infrastructure code and collaborate through version control systems, making it easier to manage complex infrastructure setups.

      *  Change Management: Terraform tracks changes to infrastructure configurations, making it easy to understand what changes will be applied before actually applying them. This helps in implementing proper change management processes and ensures that infrastructure changes are predictable and safe.

      *  Ecosystem and Modules: Terraform has a rich ecosystem of providers and modules that extend its functionality. Providers allow integration with various infrastructure services, while modules enable the reuse of infrastructure configurations, promoting modularity and code reuse.

      *  Overall, companies adopt Terraform to streamline and automate their infrastructure management processes, improve collaboration among teams, ensure consistency across environments, and take advantage of the benefits of infrastructure as code.

```

### What are the 4 commands or options that you often use while dealing terrform ?

```
    $ terraform init        : Initializes t erraform working directory by downloading the necessary providers and modules specified in the configuration.

    It prepares the directory to be used with Terraform, setting up the backend, plugins, and other necessary components for managing infrastructure as code.

    $ terraform plan        : It previews the changes to infrastructure before applying them, showing the actions Terraform will take to achieve the desired state specified in the configuration.


    $ terraform apply       : It applies the changes defined in the Terraform configuration, creating, updating, or deleting resources to achieve the desired infrastructure state. ( Techincally applies the changes show on the plan )

```

### What are + , -,  -/+ when dealing with terraform plan ?


```
    + (Plus): Indicates a resource that Terraform plans to create as part of the proposed changes. This means a new resource will be added to the infrastructure when you apply the plan.

    - (Minus): Indicates a resource that Terraform plans to destroy. This means that the associated infrastructure resource will be deleted when you apply the plan.

    -/+ (Minus Plus): Indicates a resource that Terraform plans to both destroy and recreate. This typically happens when there are changes to a resource that require recreation rather than an in-place update. The resource will be first destroyed, and then a new one will be created in its place.

```

### When enclose a variable in Quotes and when to use $ notation for a variable ???

> Whenever your variable is enclosed in a set of strings or in between a sentence, then we to enslose them in strings and with bash notation.
> Strings are supposed to be enclosed in double quotes whilst Numbers & Booleans don't need any type of quotes.


# Varaible Precenden In Terraform

In Terraform, variables play a crucial role in parameterizing your infrastructure code. Understanding the precedence of different variable sources helps you manage and prioritize configuration values effectively. Here's a brief overview of the Terraform variable precedence:

 ###   1) -var Command-Line Option:

```
                Highest precedence.
                Values passed using the -var command-line option directly override any other variable sources.
                Example: terraform apply -var="instance_count=3"
```
###    2) -var-file Command-Line Option:

```
                Next in precedence after the -var command-line option.
                Allows you to specify a file containing variable values.
                Example: terraform apply -var-file="custom-vars.tfvars"
```
###    3) terraform.auto.tfvars:

```
                Automatically loaded if present in the working directory.
                Lower precedence compared to command-line options.
                Useful for storing default values and environment-specific configurations.
                    Example: terraform.auto.tfvars
```
####    4) terraform.tfvars:
```
                Similar to terraform.auto.tfvars but requires an explicit load using the -var-file command-line option.
                Lower precedence compared to command-line options.

                        Example: terraform apply -var-file="terraform.tfvars"
                Understanding this precedence allows you to manage your Terraform configurations flexibly, whether you're setting default values, using environment-specific overrides, or providing values dynamically through command-line options.
```


# Attribure vs Argument In Terraform


### Arguments

```
    Properties of the resource that you would to define as a part of the creation.
        Ex:  instance_type, ami

```

### Attributes 

```
    Attributes are the properties of the machine that woould be coming up post the creation of the resource.

        Ex : private_ip, instance_id
```


### What will happen when there is change in the code ? Is it going to destroy and create the infra or just updates the changes as per what's defined the code ????

```

Ex : 
    Did a change in the tag, terraform updated the name of the instane without any disruption
    Did a change of instance_type : Terraform shutdowns the machine and changed the instance and then started ( disruptive )
    Did a change of AMI, instance was recreated.


Based on the type of change that you make, terraform is going to act accordingly, that also means based on the type of change it can be either disruptive or non-disruptive.

```


### What will happen if you change any of the properties of the instance manually that was provisioned with terraform ???

```
    Then terraform considers that as a DRIFT.

    Drift means change in the configuration than what terraform has created !!!

    TERRAFORM considers the properties that are mentioned in the code as a source of truth and will vanish the changes that are done manually.

```


### Datasource 

```
    Datasource in terraform helps you fetch the information of the already existing resources!!!!

    These dataSources are also specific to the resources and you need to get the infomation from the terraform documentation.
```


### what is terraform state file ?
```

    The Terraform state file is a JSON-formatted file that keeps track of the resources managed by Terraform and their current state in the target infrastructure.

    That also means storing the STATE File also needs some better strategy!!!
```


### What will happen if you lose the stateFile ?


```
    That can be referred as catastrophy and that's not at all acceptable.

    This means that terraform lost track of all the infra changes made or created by it.
```

### Then what's the best strategy to store or host the statefile ?

```
    1) Hosting a remote backend to store stateFile, so that everyone in team or your terraform always looks for the statefile on a central location.
    2) Enable versioning to the backend.
    3) Enable encrytion the backend bucket
```

### What is a Backend In Terraform ?

```
    A backend defines where Terraform stores its state data files.

```


### Modules Sources In Terraform !!!

```
    1) S3 Bucket
    2) Github                       ( Keeping Modules Remote is quite mature thing and we would like to use it more in our training )
    3) Local Modules
    4) Terraform Registry Modules
```


### How can we pass the outputs from One Module to Other In terraform 

```
    In Terraform, you cannot pass the outputs from one module to another module directly. It should be only through ROOT Module Only.

```


### Provisioners In Terraform

    Provisioners in terraform help's us to execute some either on Local Instance from where you're running terraform or on the top of the resources created by terraform.

     It's is a mechanism that allows execution of scripts or commands on a resource during or after its creation, enabling customization and configuration. Provisioners are often used for tasks like software installation, configuration management, or any post-resource creation actions.


### Types Of Provsioners In Terraform :  

    Based on where you execute the task, we have 3 types of provisioners : 

```
    1) Local Provisoner           [ This execute tasks on the top of the local machine where you're running  terraform ]
    2) Remote Provisioner         [ This executed tasks on the top of the remote machine or the created infra by terraform ]
    3) File Provisioner           [ This is used to copy the file from local machine to the created resouce ]
    4) Connection Provisioner
```



### Provisioners Placement!!!

```
    If you place a provisioner with in the resource, if the provisioner fails because of any reason, terraform consider the entire resource creation itself as a failure and marks the created object as tained that means on next Terraform Apply Object will be destroyed and re-creaated

    That's why it's always recommended to keep the provisoners outside the Resource.

    But provisioners should always be kept with in the resoruce only!!!!

    That's why there is a null resource, which creates nothing and that's main intention is to run provisoners.

```


### What are the points to be considered while designing and creating a network ?

```
    1) Understand the business need of the network
    2) Analyze the number of ip address needed.
    3) Understand how many subnetsa are needed.
    4) Conclude how many subnets need access to internet and how many don't
    5) Select a CIDR Range either Class-A or B ( 10 or 172 series )
    6) Ensure the selected CIDR Range is not conflicing with any of your existing AWS Accounts in your project.

```

### For our roboshop project, how many Ip's do I need ?

```
    DEV  :   256   :   10.0.0.0/24 
    PROD :  1024   :   10.1.0.0/22

    In Dev VPC, let's provision 2 subnets in Public Subnet in us-east-1a, us-east-1b  and 2 Private Subnets in us-east-1a, us-east-1b keeping the high availability in mind.

    DEV VPC CIDR   : 10.0.0.0/24 
        public-subnet-cidr  : 10.0.0.0/26   , 10.0.0.64/26
        private-subnet-cidr : 10.0.0.128/26	, 10.0.0.192/26	

    PROD VPC CIDR  : 10.1.0.0/22
        public-subnet-cidr  : 10.1.0.0/24 , 10.1.1.0/24
        private-subnet-cidr : 10.1.2.0/24 , 10.1.3.0/24

```


### What is Public and Private Subnets ?

```
    Both of them are pieces from a network. But the major difference is Public IP Address. 
    
    In public subnets, all the machines that are launched will have a Public IP Address by default and can be accessed directly from the internet.

    In private subnets, all the machines that are launched will only have a private IP Address and no Public IP Address ( that means we cannot connect to these machines from public network )

```


###  In our project, what all machines should be in private network .

```
    Apart from frontend, rest of all the components  [ backend, db's ] should be in Private Network Only

```


### How can I implement the network with a public and a private network ?

```
    1) Create a VPC with default tenancy and mention the CIDR as 10.2.0.0/24
    2) Create subnets one in us-east-1a and us-east-1b with subnets as 10.2.0.0/25 and 10.2.0.128/25 respectively
    3) Ensure you mention one of the subnet as public and the other as private.
    4) Ensure you enable "Enable auto-assign public IPv4 address" on the public-subnet and this ensures the Public IP Address to the instances launched in this subnet. Don't do the same for Private-Subnet.
    5) Create a Internet Gateway and attach it to the roboshop-vpc ( you can attach only one IGW per VPC )
    6) Create a Public-Route Table and associate with the public-subnet and with a route of 0.0.0.0/0 with IGW
    7) Create a Private-Route Table and associate with private-subnet and with a default route.
    8) Now you should be able to SSH to the machines launched in the public-subnet

    9) Also public-machines should be able to talk to the internet. But not the private machines.

    10) All the machine should have access to internet and why ?  ( If a machine needs to download a package, how do we update packages )

    11) We need to desing the network in such a way that, No one should be able to access the private machines from the internet. But, if the private machines want to talk, they should be able to talk to the internet.

    12) But if you try to SSH from your workStation to any of the Public or private machines with their Privat IP, it won't as they are in 2 different networks.

    13) How can we enable private communication between 2 different VPC's ? [ Using VPC Peering ] 

    14) Create VPC Peering as demonstrated between 2 different VPC's

    15) Update the route tables of default-rt, public-rt and private-rt with respective CIDR range, then private communication would be enabled between the 2 VPC's.


```


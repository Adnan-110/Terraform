# Terraform

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
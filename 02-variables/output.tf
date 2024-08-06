#  Declaring the empty variable 
#  variable "sample" {}

#  Declaring a variable with a default value 
    variable "Dunki" {
        default = "SRK"
    }

#  Printing a variable with outputs 
    output "Dunki-Cast" {
        # value = var.Dunki
        value = "The Main Lead of Dunki is ${var.Dunki}"
    }

#   Declaring a Numerical type Variable
    variable "Numerical" {
        default = 1000
    }

    output Numerical-output{
        value = var.Numerical
    }

#   Declaring a List type variable

    variable "Details"{
        default = [
            "SRK" ,
            "Tapsee" ,
            21 ,
            true
        ]
    }

#   Printing List type variable

    output "Dunki-Details" {
        value = "The Dunki Film is Going to Release on ${var.Details[2]}. The Male Lead of the Film is ${var.Details[0]} and The Female Lead of the Film is ${var.Details[1]} "
    }       

#   Declaring a map type variable
    variable "Detail"{
        default = {
            actor = "SRK"
            actress = "Tapsee"
            Release = 21
        }
    }

#   Printing Dictionary type Variable
    output "Dunki-Detail"{
        value = "The Dunki Film is Going to Relase on ${var.Detail["Release"]}. The Male Lead of the Film is ${var.Detail["actor"]} and The Female Lead of the Film is ${var.Detail["actress"]} "
    }

#  In Reality, We will write the code very generic and values would be fetched from from external file based  on the environment.
#  We can declare the varaibles in a variables file and that would be picked-up by terraform and the variables file should always end with *.tfvars.check 
#  terraform.tfvars is the default file that would be picked-up 

variable "Director" {}

output "Dunki-Director" {
    value = var.Director
}

variable "Producer" {}

output "Dunki-Producer" {
    value = var.Producer
}

variable "environment" {}

output "environment_name" {
    value = "Name of the environment is ${var.environment}"
}

# Example of the Usage of Shell Variable 

# You can supply the value of the SHELL variable from command line using export
# export TF_VAR_varName=value

variable "singer" {}

output "singer_name"{
    value = var.singer
}

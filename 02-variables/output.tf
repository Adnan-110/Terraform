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
            21-12-2023 ,
            true
        ]
    }

#   Printing List type variable

    output "Dunki-Details" {
        value = "The Dunki Film is Going to Release on ${var.Details[2]}. The Male Lead of the Film is ${var.Details[0]} and The Female Lead of the Film is ${var.Details[1]} "
    }       
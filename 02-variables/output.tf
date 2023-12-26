#  Declaring the empty variable 
#  variable "sample" {}

#  Declaring a variable with a default value 
    variable "Dunki" {
        default = "SRK"
    }

#  Printing a variable with outputs 
    output "Dunki-Cast" {
        value = var.Dunki
    }
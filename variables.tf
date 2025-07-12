variable "prefix" {
  description = "The prefix used for all resources in this example"
  default     = "estus"
}

variable "location" {
  description = "The Azure location where all resources in this example should be created"
  default     = "East US"
}

variable "application" {
  description = "This is for the application."
  default     = "aks"
}

variable "environment" {
  description = "This is the environment variable dev, test, prod"
  default     = "prod"
}

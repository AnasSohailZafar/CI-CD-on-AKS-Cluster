variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
  default     = "swedencentral"
}

variable "appinsght_resources_tags" {
  type        = map(string)
  description = "Specify tags to add to \"rgname\" resources"
  default = {
    Application = "Application Insights"
    CostCenter  = "1016"
    Department  = "IT"
    Environment = "Integration"
    ManagedBy   = "Infra Team"
    Owner       = "IT Team"
  }
}
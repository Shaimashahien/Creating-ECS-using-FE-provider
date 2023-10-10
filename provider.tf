terraform {
  required_providers {
    flexibleengine = {
      source = "FlexibleEngineCloud/flexibleengine"
      version = "1.42.0"
    }
  }
}

provider "flexibleengine" {
region = var.REGION
access_key = var.ACCESS_KEY
secret_key = var.SECRET_KEY
domain_name = var.DOMAIN_NAME
tenant_id = var.TENAT_ID
}

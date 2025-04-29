# variables.tf
# This file defines the input variables used in the Terraform configuration.
# Each variable includes a description, type, and optional default value.

variable "subscription_id" {
  description = "The Azure subscription ID to use for the AzureRM provider."
  type        = string
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "eastus"
}

variable "workspace_name" {
  type        = string
  description = "Name of the Azure ML workspace"
}

variable "compute_name" {
  type        = string
  description = "Name of the compute cluster"
}

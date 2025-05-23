# -------------------------------------------------------------------------------------
#
# Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
#
# This software is the property of WSO2 LLC. and its suppliers, if any.
# Dissemination of any information or reproduction of any material contained
# herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
# You may not alter or remove any copyright or other notice from copies of this content.
#
# --------------------------------------------------------------------------------------

variable "project" {
  type        = string
  description = "Name of the project"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
variable "region" {
  type        = string
  description = "Code of the region"
}
variable "application" {
  type        = string
  description = "Purpose of the EKS Cluster"
}
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes Version"
}
variable "endpoint_private_access" {
  type        = bool
  description = "Enable private access to Cluster"
  default     = true
}
variable "endpoint_public_access" {
  type        = bool
  description = "Enable public access to Cluster"
  default     = false
}
variable "public_access_cidrs" {
  type        = list(string)
  description = "Public CIDRs which can access the cluster API Server"
  default     = []
}
variable "service_ipv4_cidr" {
  type        = string
  description = "CIDR block for K8S Service"
}
variable "eks_vpc_id" {
  type        = string
  description = "ID of the VPC to create the subnets"
}
variable "subnet_details" {
  type = list(object({
    availability_zone = string
    cidr_block        = string
    custom_routes = list(object({
      cidr_block = string
      ep_type    = string
      ep_id      = string
    }))
  }))
  default = []
}
variable "secret_encryption_cmk" {
  type        = string
  description = "KMS Key ID for encrypting Kubernetes secrets"
  default     = null
}
variable "enabled_cluster_log_types" {
  type        = list(string)
  description = "List of cluster log types to enable"
  default     = []
}
variable "tags" {
  type        = map(string)
  description = "Tags to be associated with the EKS"
  default     = {}
}
variable "enable_ebs_csi_driver" {
  type        = bool
  description = "Enable EBS CSI Driver"
  default     = false
}
variable "enable_efs_csi_driver" {
  type        = bool
  description = "Enable EFS CSI Driver"
  default     = false
}
variable "enable_autoscaler" {
  type        = bool
  description = "Enable Cluster Autoscaler"
  default     = false
}
variable "enable_cluster_loadbalancer" {
  type        = bool
  description = "Enable Cluster Load Balancer"
  default     = false
}
variable "enable_fluent_bit" {
  type        = bool
  description = "Enable Fluent Bit"
  default     = false
}
variable "enable_cloudwatch_agent" {
  type        = bool
  description = "Enable CloudWatch Agent"
  default     = false
}
variable "cluster_iam_role_arn" {
  type        = string
  description = "IAM Role ARN for the EKS Cluster"
  default     = null
}
variable "cluster_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the EKS Cluster"
  default     = []
}
variable "authentication_mode" {
  type        = string
  description = "EKS Cluster authentication mode"
  default     = "CONFIG_MAP"
}
variable "bootstrap_cluster_creator_admin_permissions" {
  type        = bool
  description = "Whether or not to bootstrap the access config values to the cluster"
  default     = false
}

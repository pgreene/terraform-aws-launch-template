variable "name" {
  description = "resource name"
  default = null
}

variable "tags" {
  default = null
}

variable "device_name" {
  description = "The name of the device to mount"
  default = null
}

variable "device_name_b" {
  description = "The name of the device to mount"
  default = null
}

variable "no_device" {
  description = "Suppresses the specified device included in the AMI's block device mapping."
  default = null
}

variable "no_device_b" {
  description = "Suppresses the specified device included in the AMI's block device mapping."
  default = null
}

variable "virtual_name" {
  description = "The Instance Store Device Name - e.g. ephemeral0."
  default = null
}

variable "virtual_name_b" {
  description = "The Instance Store Device Name - e.g. ephemeral0."
  default = null
}

variable "ebs" {
  default = null
}

variable "ebs_delete_on_termination" {
  default = null
}

variable "ebs_delete_on_termination_b" {
  default = null
}

variable "encrypted" {
  default = null
}

variable "encrypted_b" {
  default = null
}

variable "kms_key_id" {
  default = null
}

variable "kms_key_id_b" {
  default = null
}

variable "snapshot_id" {
  default = null
}

variable "snapshot_id_b" {
  default = null
}

variable "volume_size" {
  description = "The size of the volume in gigabytes"
  default = 30
}

variable "volume_size_b" {
  description = "The size of the volume in gigabytes"
  default = null
}

variable "volume_type" {
  description = "The type of volume. Can be standard, gp2, or io1"
  default = "gp2"
}

variable "volume_type_b" {
  description = "The type of volume. Can be standard, gp2, or io1"
  default = null
}

variable "iops" {
  description = "The amount of provisioned IOPS. This must be set with a volume_type of io1."
  default = null
}

variable "iops_b" {
  description = "The amount of provisioned IOPS. This must be set with a volume_type of io1."
  default = null
}

variable "capacity_reservation_specification" {
  default = null
}

variable "capacity_reservation_preference" {
  #default = "open"
  default = null
}

variable "capacity_reservation_target" {
  description = ""
  default = null
}

variable "capacity_reservation_id" {
  default = null
}

variable "cpu_options" {
  default = null
}

variable "core_count" {
  description = "The number of CPU cores for the instance."
  default = null
}

variable "threads_per_core" {
  description = "The number of threads per CPU core. To disable Intel Hyper-Threading Technology for the instance, specify a value of 1. Otherwise, specify the default value of 2."
  default = null
}

variable "credit_specification" {
  default = null
}

variable "cpu_credits" {
  description = "The credit option for CPU usage. Can be standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default."
  default = null
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  default = null
}

variable "ebs_optimized" {
  description = "If true the launched EC2 instance will be EBS-optimized."
  default = true
}

variable "elastic_gpu_specifications" {
  default = null
}

variable "gpu_specifications_type" {
  description = "The Elastic GPU Type https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-graphics.html"
  #default = "H1"
  default = null
}

variable "elastic_inference_accelerator" {
  default = null
}

variable "elastic_inference_accelerator_type" {
  #default = "eia1.medium"
  default = null
}

variable "iam_instance_profile" {
  default = null
}

variable "iam_instance_profile_name" {
  default = null
}

variable "iam_instance_profile_arn" {
  default = null
}

variable "image_id" {
  default = null
}

variable "instance_initiated_shutdown_behavior" {
  #default = "terminate"
  default = null
}

variable "instance_market_options" {
  default = null
}

variable "market_type" {
  default = null
}

variable "spot_options" {
  default = null
}

variable "block_duration_minutes" {
  default = null
}

variable "instance_interruption_behavior" {
  default = null
}

variable "max_price" {
  default = null
}

variable "spot_instance_type" {
  default = null
}

variable "valid_until" {
  default = null
}

variable "instance_type" {
  default = null
}

variable "kernel_id" {
  default = null
}

variable "key_name" {
  default = null
}

variable "license_specification" {
  default = null
}

variable "license_configuration_arn" {
  #default = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  default = null
}

variable "monitoring_enabled" {
  default = true
}

variable "network_interfaces" {
  default = null
}
variable "associate_public_ip_address" {
  default = null
}

variable "ni_description" {
  default = null
}

variable "ni_delete_on_termination" {
  default = null
}

variable "device_index" {
  default = null
}

variable "ipv6_addresses" {
  default = null
}

variable "ipv6_address_count" {
  default = null
}

variable "network_interface_id" {
  default = null
}

variable "private_ip_address" {
  default = null
}

variable "ipv4_addresses" {
  default = null
}

variable "ipv4_address_count" {
  default = null
}

variable "security_groups" {
  default = null
}

variable "subnet_id" {
  default = null
}

variable "placement" {
  default = null
}

variable "placement_affinity" {
  default = null
}

variable "placement_availability_zone" {
  default = null
}

variable "placement_group_name" {
  default = null
}

variable "placement_host_id" {
  default = null
}

variable "placement_spread_domain" {
  default = null
}

variable "placement_tenancy" {
  default = null
}

variable "metadata_options" {
  default = null
}

variable "http_endpoint" {
  default = null
}

variable "http_tokens" {
  default = null
}

variable "http_put_response_hop_limit" {
  default = null
}

variable "ram_disk_id" {
  description = ""
  default = "test"
}

variable "vpc_security_group_ids" {
  default = null
}

variable "resource_type" {
  description = ""
  default = "instance"
}

variable "user_data" {
  description = ""
  //default = "${base64encode(...)}"
  default = ""
}

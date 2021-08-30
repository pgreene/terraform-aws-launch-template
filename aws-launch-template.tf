resource "aws_launch_template" "general" {
  name_prefix = var.name
  description = var.name
  image_id = var.image_id
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type = var.instance_type
  kernel_id = var.kernel_id
  key_name = var.key_name
  ram_disk_id = var.ram_disk_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data = var.user_data

  block_device_mappings {
    device_name = var.device_name
    no_device = var.no_device
    virtual_name = var.virtual_name
    dynamic ebs {
    for_each = var.ebs == null ? [] : tolist([var.ebs])
      content {
        delete_on_termination = var.ebs_delete_on_termination
        encrypted = ebs.value.encrypted
        kms_key_id = ebs.value.kms_key_id
        snapshot_id = ebs.value.snapshot_id
        volume_size = ebs.value.volume_size
        volume_type = ebs.value.volume_type
        iops = ebs.value.iops
      } 
    }
  }

/* 
This block below needs work since there's an unusable nested block within it
See terraform resource doc for launch templates
*/
  dynamic capacity_reservation_specification {
    for_each = var.capacity_reservation_specification == null ? [] : tolist([var.capacity_reservation_specification])
    content {
      capacity_reservation_preference = capacity_reservation_specification.value.capacity_reservation_preference
      /*
      dynamic capacity_reservation_target {
        for_each capacity_reservation_target == null ? [] : tolist([var.capacity_reservation_target])
        content {
          capacity_reservation_id = capacity_reservation_target.value.capacity_reservation_id
        }
      }
      */
    }
  }

  dynamic "cpu_options" {
    for_each = var.cpu_options == null ? [] : [var.cpu_options]
    content {
      core_count = cpu_options.value.core_count
      threads_per_core = cpu_options.value.threads_per_core
    }
  }

  dynamic "credit_specification" {
    for_each = var.credit_specification == null ? [] : [var.credit_specification]
    content {
      cpu_credits = credit_specification.value.cpu_credits
    }
  }

  disable_api_termination = var.disable_api_termination
  
  ebs_optimized = var.ebs_optimized

  dynamic "elastic_gpu_specifications" {
    for_each = var.elastic_gpu_specifications == null ? [] : [var.elastic_gpu_specifications]
    content {
      type = elastic_gpu_specifications.value.gpu_specifications_type
    }
  }

  dynamic "elastic_inference_accelerator" {
    for_each = var.elastic_inference_accelerator == null ? [] : [var.elastic_inference_accelerator]
    content {
      type = elastic_inference_accelerator.value.elastic_inference_accelerator_type
    }
  }

  dynamic "iam_instance_profile" {
    for_each = var.iam_instance_profile == null ? [] : [var.iam_instance_profile]
    content {
      name = iam_instance_profile.value.iam_instance_profile_name
      arn = iam_instance_profile.value.iam_instance_profile_arn
    }
  }

  dynamic "instance_market_options" {
    for_each = var.instance_market_options == null ? [] : [var.instance_market_options]
    content {
    market_type = var.market_type
    dynamic spot_options {
      for_each = var.spot_options == null ? [] : tolist([var.spot_options])
        content {
          block_duration_minutes = spot_options.value.block_duration_minutes
          instance_interruption_behavior = spot_options.value.instance_interruption_behavior
          max_price = spot_options.value.max_price
          spot_instance_type = spot_options.value.spot_instance_type
          valid_until = spot_options.value.valid_until
        }
      }
    }
  }

  dynamic "license_specification" {
    for_each = var.license_specification == null ? [] : [var.license_specification]
    content {
      license_configuration_arn = license_specification.value.license_configuration_arn
    }
  }

  monitoring {
    enabled = var.monitoring_enabled
  }

  dynamic "network_interfaces" {
    for_each = var.network_interfaces == null ? [] : [var.network_interfaces]
    content {
      associate_public_ip_address = network_interfaces.value.associate_public_ip_address
      description = network_interfaces.value.description
      delete_on_termination = network_interfaces.value.delete_on_termination
      device_index = network_interfaces.value.device_index
      ipv6_addresses = network_interfaces.value.ipv6_addresses
      ipv6_address_count = network_interfaces.value.ipv6_address_count
      network_interface_id = network_interfaces.value.network_interface_id
      private_ip_address = network_interfaces.value.private_ip_address
      ipv4_addresses = network_interfaces.value.ipv4_addresses
      ipv4_address_count = network_interfaces.value.ipv4_address_count
      security_groups = network_interfaces.value.security_groups
      subnet_id = network_interfaces.value.subnet_id
    }
  }

  dynamic "placement" {
    for_each = var.placement == null ? [] : [var.placement]
    content {
      affinity = placement.value.placement_affinity
      availability_zone = placement.value.placement_availability_zone
      group_name = placement.value.placement_group_name
      host_id = placement.value.host_id
      spread_domain = placement.value.placement_spread_domain
      tenancy = placement.value.placement_tenancy
    }
  }

  dynamic "metadata_options" {
      for_each = var.metadata_options == null ? [] : [var.metadata_options]
      content {
        http_endpoint = metadata_options.value.http_endpoint
        http_tokens = metadata_options.value.http_tokens
        http_put_response_hop_limit = metadata_options.value.http_put_response_hop_limit
      }
  }
  
  tag_specifications {
    resource_type = var.resource_type
    tags = var.tags
  }

  tag_specifications {
    resource_type = "volume"
    tags = var.tags
  }

  tags = var.tags
}


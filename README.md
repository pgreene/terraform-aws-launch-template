## HOWTO
How to reference this launch template module, with an Autoscaling Group

```bash
module "aws_lt" {
  source = "git@github.com:pgreene/terraform-aws-launch-template.git"
  #source  = "app.terraform.io/GITHUB-PROJECT/launch-template/aws"
  #version = "4.0.0"
  name = "qa-won-lt"
  image_id = data.aws_ssm_parameter.ami_id.value
  ram_disk_id = null
  instance_type = "m5.xlarge"
  key_name = "prod-won-devops"
  vpc_security_group_ids = [module.aws_sg.id]
  iam_instance_profile = {
    iam_instance_profile_name = module.aws_iam_instance_profile.name
    iam_instance_profile_arn = null
  }
  market_type = null
  ebs = {
    volume_size = 30
    volume_type = "gp2"
    ebs_delete_on_termination = true
    encrypted = true
  }
 
  /*
  spot_options = {
    block_duration_minutes = 0
    max_price = "0.1300"
    instance_interruption_behavior = "stop"
    spot_instance_type = "one-time"
    valid_until = "2021-12-02T10:00:00-05:00"
  }
  */

  tags = {
      Name = "qa-won-lt",
      Environment = "prod",
      Cluster = "won",
      Component = "won",
      CreatedBy = "Terraform",
      Owner = "pgreene"
    }
}

module "aws_asg" {
  source = "git@github.com:pgreene/terraform-aws-asg.git"
  
  #source  = "app.terraform.io/GITHUB-PROJECT/autoscaling-group/aws"
  #version = "3.0.3"
  
  name = join("-",[module.label.id,"asg"])
  launch_configuration = null
  ## HERE IS WHERE THE LAUNCH TEMPLATE (above) IS REFERENCED BY THE ASG based on LAUNCH TEMPLATE MODULE ID OUTPUT##
  launch_template = {
    id = module.aws_lt.id
    lc_version = "$Latest"
  }
  placement_group = module.aws_pg.id
  min_size = 0
  max_size = 1
  desired_capacity = 1
  target_group_arns = [module.aws_lb_target_group_80.arn, module.aws_lb_target_group_3389.arn]
  vpc_zone_identifier = local.private_subnets
  tags = [
    {
      key = "Name"
      value = "prod-won-ec2"
      propagate_at_launch = true
    },
    {
      key = "Environment"
      value = "prod"
      propagate_at_launch = true
    },
    {
      key = "Cluster"
      value = "won"
      propagate_at_launch = true
    },
    {
      key = "Component"
      value = "won"
      propagate_at_launch = true
    },
    {
      key = "Createdby"
      value = "Terraform"
      propagate_at_launch = true
    },
    {
      key = "Owner"
      value = "pgreene"
      propagate_at_launch = true
    }
  ]
}
```
resource "aws_launch_configuration" "bastion" {
  name            = "bastion-config"
  image_id        = var.ami_instance_image
  instance_type   = var.aws_instance_type
  key_name        = var.ssh_key_name
  security_groups = [aws_security_group.ssh_access.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bastion" {
  name                 = "bastion"
  launch_configuration = aws_launch_configuration.bastion.name
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
  health_check_grace_period = 300
  health_check_type         = "EC2"

  tags = [
    {
      key                 = "Name"
      value               = "Bastion ASG"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = var.resource_tag
      propagate_at_launch = true
    }
  ]
}

resource "aws_launch_configuration" "app_server" {
  name            = "app-server-config"
  image_id        = var.ami_instance_image
  instance_type   = var.aws_instance_type
  key_name        = var.ssh_key_name
  user_data       = file("app_data.sh")
  security_groups = [aws_security_group.private_subnet_access.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app_server" {
  name                 = "app-server"
  launch_configuration = aws_launch_configuration.app_server.name
  max_size             = 4
  min_size             = 2
  vpc_zone_identifier = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
  health_check_grace_period = 300
  health_check_type         = "ELB"

  tags = [
    {
      key                 = "Name"
      value               = "App-Server ASG"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = var.resource_tag
      propagate_at_launch = true
    }
  ]
}

data "aws_instance" "bastion" {
  instance_tags = {
    "Name" = "Bastion ASG"
  }

  depends_on = [
    aws_autoscaling_group.bastion
  ]
}

output "asg_bastion_ip" {
  value = data.aws_instance.bastion.public_ip
}

data "aws_instances" "app-server" {
  instance_tags = {
    "Name" = "App-Server ASG"
  }

  depends_on = [
    aws_autoscaling_group.app_server
  ]
}

output "asg_app_server_ips" {
  value = data.aws_instances.app-server.private_ips
}
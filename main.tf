###########################################################
# ECS Auto Scaling Group and Launch configuration
###########################################################
resource "aws_launch_configuration" "ecs" {
        name_prefix = "ecs-lc-${var.customer}-${var.role}-${var.environment_name}-lc-"
        image_id             = "${var.ecs_ami}"
        instance_type        = "${var.instance_type}"
        key_name             = "${var.key_name}"
        security_groups      = ["${var.security_group_ids}"]
        iam_instance_profile = "${var.iam_instance_profile}"
        /*
        * Root volume size
        */
        root_block_device {
                volume_type = "${var.vol_root_type}"
                volume_size = "${var.vol_root_size}"
        }
        /*
        * Use for docker metadata partition
        */
        ebs_block_device {
                device_name = "/dev/xvdcz"
                volume_type = "${var.vol_docker_type}"
                volume_size = "${var.vol_docker_size}"
        }
        lifecycle {
                create_before_destroy = true
        }
        user_data            = "${var.user_data}"
}

resource "aws_autoscaling_group" "ecs" {
        name                 = "ecs-asg-${var.customer}-${var.role}-${var.environment_name}"
        vpc_zone_identifier = ["${var.availability_zones}"]
        launch_configuration = "${aws_launch_configuration.ecs.name}"
        min_size             = "${var.asg_min_size}"
        max_size             = "${var.asg_max_size}"
        desired_capacity     = "${var.asg_min_size}"
        termination_policies = ["${var.termination_policies}"]
        load_balancers = ["${var.load_balancers}"]
        lifecycle {
                create_before_destroy = true
        }
        tag {
                key = "Name"
                value = "${var.customer}.aws-${var.region}-${var.role}.${var.project}-xx"
                propagate_at_launch = true
        }
        tag {
                key = "Environment"
                value = "${var.environment_name}"
                propagate_at_launch = true
        }
        tag {
                key = "Role"
                value = "${var.role}"
                propagate_at_launch = true
        }
}

###########################################################
# ECS Private Cluster
###########################################################
resource "aws_ecs_cluster" "ecs-cluster" {
        name = "${var.cluster_name}"
}

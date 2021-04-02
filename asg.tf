# External asg with launch template
resource "aws_launch_template" "asglt" {
  name_prefix   = "asglt"
  image_id      = "ami-013f17f36f8b1fefb"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "ext_asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 4
  min_size           = 1

  launch_template {
    id      = aws_launch_template.asglt.id
    version = "$Latest"
  }
}

# Create a load balancer attachment for the external asg
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.ext_asg.id
 # elb                    = aws_elb.extlb.id
}

# Internal asg with launch template
resource "aws_launch_template" "intlt" {
  name_prefix   = "intlt"
  image_id      = "ami-013f17f36f8b1fefb"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "int_asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 4
  min_size           = 1

  launch_template {
    id      = aws_launch_template.intlt.id
    version = "$Latest"
  }
}
# Create a load balancer attachment for the internal asg
resource "aws_autoscaling_attachment" "asg_attachment_int" {
  autoscaling_group_name = aws_autoscaling_group.int_asg.id
  #elb                    = aws_elb.intlb.id
}
resource "aws_lb" "extlb" {
  name               = "externallb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ext_sg.id]
  subnets            = ["${aws_subnet.pub1.id}", "${aws_subnet.pub2.id}"]

  tags = {
     Name = "publiclb"
  }
}

resource "aws_lb" "intlb" {
  name               = "internallb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.int_sg.id]
  subnets            = ["${aws_subnet.pri1.id}", "${aws_subnet.pri2.id}"]

  tags = {
     Name = "privatelb"
  }
}

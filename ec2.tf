#key-pair

resource "aws_key_pair" "my_key" {
  key_name   = "terraform-ansible-key"
  public_key = file("terraform-ansible-key.pub")
}

#VPC

resource "aws_default_vpc" "default" {

}

#security group

resource "aws_security_group" "my_sg" {
  
  name =    "terraform-ansible-sg"
  description = "this is will add TF security group"
  vpc_id = aws_default_vpc.default.id 
    
      ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
    for_each = tomap({
        terraform-ansible-master = "ami-0ec10929233384c7f", #ubuntu
        terraform-ansible-1 = "ami-01b14b7ad41e17ba4",  #amazon linux
        terraform-ansible-2 = "ami-0ec10929233384c7f",    #ubuntu
        terraform-ansible-3 = "ami-056244ee7f6e2feb8"  #RedHat
    }

    )
    depends_on = [ aws_default_vpc.default, aws_key_pair.my_key, aws_security_group.my_sg]

    key_name = aws_key_pair.my_key.key_name
    ami = each.value
    instance_type = "t3.micro"
    security_groups = [ aws_security_group.my_sg.name ]

    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }

    tags = {
     Name = each.key
}
}




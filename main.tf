provider "aws" {
  access_key = "AKIAYRBV4IAGBHG5GMHL"
  secret_key = "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"
  region     = "us-east-2"
}

resource "aws_instance" "terraform" {
  ami = "ami-09cb870e3af915bac"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  key_name = "saplabs"
  tags {
    Name = "terraform"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

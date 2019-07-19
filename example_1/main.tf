provider "aws" {
  region  = "${var.region}"
  access_key = "${var.example_aws_access_key_id}"
  secret_key = "${var.example_aws_secret_access_key}"
}

resource "aws_instance" "demo_terraform_node_1" {
  ami = "${var.ami}"
  instance_type = "t2.micro"

  tags {
    Name = "demo_terraform_node_1"
  }
}

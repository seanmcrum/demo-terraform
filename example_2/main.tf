provider "aws" {
  region     = "${var.region}"
  access_key = "${var.dev_aws_access_key_id}"
  secret_key = "${var.dev_aws_secret_access_key}"
}

resource "aws_instance" "demo_terraform_node_2" {
  ami = "${var.ami}"
  instance_type = "t2.micro"

  tags {
    Name = "demo_terraform_node_2"
  }
}

module "demo_terraform_module" {
  source           = "./module_ec2"

  # Passing variables defined in current repo
  ami              = "${var.ami}"
  
  # Passing variables based on other resources
  instance_type    = "${aws_instance.demo_terraform_node_2.instance_type}"

  module_node_name = "demo_terraform_node_3" 
}

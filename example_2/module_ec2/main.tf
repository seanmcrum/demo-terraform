resource "aws_instance" "demo_terraform_node_3" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "${var.module_node_name}"
  }
}

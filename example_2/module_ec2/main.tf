variable release_channel {
  description = "CoreOS Release Channel [stable, beta, alpha]"
  default = "stable"
}

data aws_ami coreos {
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["CoreOS-${lower(var.release_channel)}-*"]
  }

  owners      = ["595879546273"]
  most_recent = true
}

resource "aws_instance" "demo_terraform_node_3" {
  ami = "${data.aws_ami.coreos.id}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "${var.module_node_name}"
  }
}

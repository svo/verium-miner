provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "miner" {
  instance_type = "c4.4xlarge"
  ami = "${lookup(var.aws_amis, var.aws_region)}"
  key_name = "${var.key_name}"

  count = 2
}

# get the latest ubuntu ami id
data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "wp_keypair" {
  key_name   = "wordpress-key"
  public_key = "${file(var.WP_PUBKEY)}"
}

# wp on ubuntu 16.04
resource "aws_instance" "wp_app" {
    count = 1
    ami = "${data.aws_ami.ubuntu.id}" # ubuntu_16.04 official base

    root_block_device {
      volume_size = 8
      volume_type = "gp2"
      delete_on_termination = true
    }
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.main-pub-1.id}"
    vpc_security_group_ids = ["${aws_security_group.allow-traffic.id}", "${aws_security_group.wp_app.id}"]

    user_data = "${file("scripts/provision.sh")}"
    private_ip = "10.200.1.10"
    key_name = "${aws_key_pair.wp_keypair.key_name}" # use key pair from local

    provisioner "file" {
    source      = "scripts/docker-wp-compose"
    destination = "/home/ubuntu/"

    connection {
      user     = "ubuntu"
      private_key = "${file(var.WP_PRIKEY)}"
      }
    }

    tags {
      Name = "${var.PRJ_NAME}"
    }
    lifecycle {
      ignore_changes = ["user_data"]
    }

    # depends_on = ["aws_db_instance.mariadb"]
}


resource "aws_eip" "wp_eip" {
    instance = "${aws_instance.wp_app.id}"
    vpc = true
    tags {
      Name = "${aws_instance.wp_app.tags.Name}-eip"
    }
}

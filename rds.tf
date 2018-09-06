# resource "aws_db_subnet_group" "mariadb-subnet" {
#     name = "${var.PRJ_NAME}-mariadb-subnet"
#     description = "terra_lab RDS subnet group"
#     subnet_ids = ["${aws_subnet.main-pub-1.id}", "${aws_subnet.main-pub-2.id}"]
# }
#
# resource "aws_db_parameter_group" "mariadb-parameters" {
#     name = "mariadb-parameters"
#     family = "mariadb10.2"
#     description = "tarra_lab_parameter_group"
#     parameter {
#       name = "character_set_client"
#       value = "utf8"
#     }
#     parameter {
#       name = "character_set_connection"
#       value = "utf8"
#     }
#     parameter {
#       name = "character_set_database"
#       value = "utf8"
#     }
#     parameter {
#       name = "character_set_filesystem"
#       value = "utf8"
#     }
#     parameter {
#       name = "character_set_results"
#       value = "utf8"
#     }
#     parameter {
#       name = "character_set_server"
#       value = "utf8"
#     }
# }
#
# resource "aws_db_instance" "mariadb" {
#     allocated_storage = 10
#     engine = "mariadb"
#     engine_version = "10.2.12"
#     instance_class = "db.t2.micro"
#     identifier = "${var.PRJ_NAME}"
#     name = "wpdb"
#     username = "${var.RDS_USER}"
#     password = "${var.RDS_PASSWORD}"
#     db_subnet_group_name = "${aws_db_subnet_group.mariadb-subnet.name}"
#     parameter_group_name = "${aws_db_parameter_group.mariadb-parameters.name}"
#     multi_az = "false"
#     vpc_security_group_ids = ["${aws_security_group.allow-mariadb.id}"]
#     storage_type = "gp2"
#     backup_retention_period = 0
#     availability_zone = "${aws_subnet.main-pub-1.availability_zone}"
#     skip_final_snapshot = true
#     publicly_accessible = false
#     tags {
#       Name = "${var.PRJ_NAME}-mariadb-instance"
#     }
# }

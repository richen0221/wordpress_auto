# data "template_file" "wp-script" {
#   template = "${file("scripts/provision.sh")}"
#   vars {
#      HOST_NAME = "${var.WP_HOSTNAME}"
#   }
# }
#
# data "template_cloudinit_config" "cloudinit-wp" {
#   gzip = false
#   base64_encode = false
#
#   part {
#     content_type = "text/x-shellscript"
#     content = "${data.template_file.wp-script.rendered}"
#   }
# }

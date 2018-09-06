output "wp_app_ip" {
  value = "${aws_instance.wp_app.public_ip}"
}

output "wp_eip" {
  value = "${aws_eip.wp_eip.public_ip}"
}

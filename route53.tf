resource "aws_route53_zone" "internal_dns" {
  name   = "${var.PRIVATE_DNS_NAME}"
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.PRJ_NAME} Internal Route53 DNS"
  }

  lifecycle {
    #    prevent_destroy = true
  }
}


# private DNS
# for rds
# resource "aws_route53_record" "rds_priv_dns_record" {
#   zone_id = "${aws_route53_zone.internal_dns.zone_id}"
#   name    = "rds.${var.PRJ_NAME}.${var.PRIVATE_DNS_NAME}."
#   type    = "CNAME"
#   ttl     = "900"
#   records = ["${aws_db_instance.mariadb.address}"]
# }

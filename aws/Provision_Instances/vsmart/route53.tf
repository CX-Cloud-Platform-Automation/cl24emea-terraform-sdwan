data "aws_route53_zone" "selected" {
  count = var.route53_zone == "" ? 0 : 1
  name  = var.route53_zone
}

resource "aws_route53_record" "vsmart" {
  count   = var.route53_zone == "" ? 0 : var.counter
  zone_id = data.aws_route53_zone.selected[0].zone_id
  name    = "${format("sdwan-vsmart-%02d", count.index)}.${data.aws_route53_zone.selected[0].name}"
  type    = "A"
  ttl     = "300"
  records = [ "${aws_eip.vsmart_public[count.index].public_ip}" ]
}

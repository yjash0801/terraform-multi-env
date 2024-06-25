resource "aws_instance" "roboshop"{
    for_each = var.instance_name
    ami = data.aws_ami.centos8.id
    instance_type = each.value

    tags = {
      Name = each.key
    }
}

resource "aws_route53_record" "dns" {
    for_each = aws_instance.roboshop
    zone_id = var.zone_id
    name = "${each.key}.${var.domain_name}"
    ttl = 1
    type = "A"
    records = [startswith(each.key, "web") ? each.value.public_ip : each.value.private_ip]
}
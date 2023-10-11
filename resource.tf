resource "aws_instance" "mohan" {
    for_each = var.instancec
    ami = var.ami
    instance_type = each.value
    tags = {
      Name=each.key
    }


  
}
resource "aws_security_group" "manju" {

    name="roboshop"
    description = "these are the security groups"
    dynamic ingress {
        for_each = var.ingress
        content {
            description=ingress.value["description"]
            from_port=ingress.value["from_port"]
            to_port=ingress.value["to_port"]
            cidr_blocks=ingress.value["cidr_blocks"]
            protocol = ingress.value["protocol"]
        }
      
    }
    dynamic egress {
        for_each = var.egress
        content {
            description = egress.value["description"]
            from_port = egress.value["from_port"]
            to_port = egress.value["to_port"]
            cidr_blocks = egress.value["cidr_blocks"]
            protocol = egress.value["protocol"]
          
        }
      
    }
  
}

resource "aws_route53_zone" "chiru" {
    name="vijay.com"
  
}

resource "aws_route53_record" "name" {
    for_each = aws_instance.mohan
    zone_id = aws_route53_zone.chiru.zone_id
    name= "${each.key}"
    type="A"
    ttl=300
    records = [each.key=="web"? each.value.public_ip : each.value.private_ip]
  
}


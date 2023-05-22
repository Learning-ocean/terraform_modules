output ipaddresses {
    value = aws_instance.webserver.public_ip
    # value  = [for key,value in aws_instance.webserver : value.public_ip]
}
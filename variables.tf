variable "instancec" {
    type=map 
    default = {
        mongodb="t2.micro"
        mysql="t2.micro"
        web="t2.micro"
    }
  
}

variable "ami" {
    type=string
    default = "ami-03265a0778a880afb"
  
}

variable "ingress" {
    type = list
    default = [
        {
            from_port=80
            to_port=80
            description="this is for ssh"
            protocol="tcp"
            cidr_blocks=["0.0.0.0/0"]
        },
        {
            from_port=443
            to_port=443
            description="this is for ssh"
            protocol="tcp"
            cidr_blocks=["0.0.0.0/0"]
        },
        {
            from_port=22
            to_port=22
            description="this is for ssh"
            protocol="tcp"
            cidr_blocks=["0.0.0.0/0"]
        }
      
    ]
  
}

variable "egress" {
    type = list
    default = [
        {
            from_port=0
            to_port=0
            description="this is for ssh"
            protocol="-1"
            cidr_blocks=["0.0.0.0/0"]
        },
        {
            from_port=443
            to_port=443
            description="this is for ssh"
            protocol="-1"
            cidr_blocks=["0.0.0.0/0"]
        },
        {
            from_port=22
            to_port=22
            description="this is for ssh"
            protocol="-1"
            cidr_blocks=["0.0.0.0/0"]
        }
      
    ]
  
}
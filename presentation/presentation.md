---
marp: true
paginate: true
---

# Terraform 001
---

# Agenda

- Overview
- Why we choose Terraform
- Structure, Syntax
- State
- Demo
- Q&A

---

# Overview
![width:100%](terraform.png)

---
# Why we choose Terraform
- Multi Cloud
- Simple and fast
- Declarative Programing
- Opensource
- Large community
- ...

---

# Hello Terraform

```r
resource "PROVIDER_TYPE" "NAME" {
  [CONFIG ...]
}

```

```r
resource "aws_instance" "example" {
  ami           = "ami-40d28157"
  instance_type = "t2.micro"
}
```

---
# Variable
```r
variable "name" {
  type = string | maps | lists
  description = "(optional) describe your variable"
  default = "default value"
}
```

---
# Output
```r
output "name" {
  value = "awesome_thing"
}
```

```r
variable "awesome_name" {
  type    = string
  default = "123"
}

output "awesome_thing" {
  value = var.awesome_name
}

# terraform.tfvars
awesome_name="awesome"

```

---
# State

```json
{
  "version": 4,
  "terraform_version": "0.12.0",
  "serial": 1,
  "lineage": "1f2087f9-4b3c-1b66-65db-8b78faafc6fb",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "aws_instance",
      "name": "example",
      "provider": "provider.aws",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "ami": "ami-0c55b159cbfafe1f0",
            "availability_zone": "us-east-2c",
            "id": "i-00d689a0acc43af0f",
            "instance_state": "running",
            "instance_type": "t2.micro",
            "(...)": "(truncated)"
          }
        }
      ]
    }
  ]
}
```

---
# Terraform command
- init
- plan
- apply
- show
- destroy

---
# Demo

---
# Q&A

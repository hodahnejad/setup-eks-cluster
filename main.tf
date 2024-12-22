provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "education-eks-${random_string.suffix.result}"

     cluster_map_roles = [
    {
      rolearn : "arn:aws:iam::xxx:role/xxx",
      username : "xxx",
      groups : [
        "system:masters"
      ]
    },
    {
      rolearn : "arn:aws:iam::xxx:role/xxx",
      username : "xxx",
      groups : [
        "system:masters"
      ]
    }
  ]

}

resource "random_string" "suffix" {
  length  = 8
  special = false
}


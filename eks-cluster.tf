module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.30"

  #us-east-1
  vpc_id     = "vpc-xxx"
  subnet_ids = ["subnet-xxx", "subnet-xxx"]

  cluster_endpoint_public_access = true
  
  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "eks-node-group-1"

      instance_types = ["r5.2xlarge"]

      min_size     = 1
      max_size     = 10
      desired_size = 1
    }
  }
}

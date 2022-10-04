variable "cluster_name" {}
variable "node_group_subnets" {}
variable "vpc_id" {}
variable "project_name" {}

variable "general_nodes_instance_types" {
  default = ["t3.large"]
}

variable "node_group_name" {
  default = "general-nodes"
}

variable "eks_labels" {
  default = {
    role       = "worker-nodes"
    node-group = "general-nodes"
  }
}

variable "scaling_config" {
  default = {
    desired_size = 3
    max_size     = 10
    min_size     = 3
  }
}

variable "taints" {
  default = []
}
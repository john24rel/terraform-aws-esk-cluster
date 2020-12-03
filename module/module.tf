module "my-cluster" {
  source = "terraform-aws-modules/eks/aws"
  version = "12.0.0"
  cluster_name                                    = "my-cluster"
  cluster_version                                 = "1.14"
  subnets                                         = ["subnet-00000", "subnet-00000", "subnet-00000"]
  vpc_id                                          = "vpc-0000000000"
  instance_type                                   = "m4.large"
  asg_max_size                                    = 5
  asg_min_size                                    = 1
  region                                          = "us-east-2"
  worker_groups = [{
    instance_type = "${var.instance_type}"
    asg_max_size = "${var.asg_max_size}"
    asg_min_size = "${var.asg_min_size}"
    }
  ]
}
Copy paste to output file
output "cluster_id" {
    value = "${module.my-cluster.cluster_id}"
}
output "cluster_arn" {
    value = "${module.my-cluster.cluster_arn}"
}
output "cluster_version" {
    value = "${module.my-cluster.cluster_version}"
}
output "cluster_security_group_id" {
    value = "${module.my-cluster.cluster_security_group_id}"
}
output "workers_asg_names" {
    value = "${module.my-cluster.workers_asg_names}"
}

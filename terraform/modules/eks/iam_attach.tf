resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "alb_controller" {
  role       = aws_iam_role.alb_controller.id
  policy_arn = aws_iam_policy.alb_controller.arn
}

resource "aws_iam_role_policy_attachment" "cluster_autoscaler" {
  role       = aws_iam_role.cluster_autoscaler.id
  policy_arn = aws_iam_policy.cluster_autoscaler.arn
}

resource "aws_iam_role_policy_attachment" "cluster_elb" {
  role       = aws_iam_role.this.id
  policy_arn = aws_iam_policy.elb.arn
}

resource "aws_iam_role_policy_attachment" "argo_workflows_ecr" {
  # Indexed with 0 becase of the count argument inside the resource.
  role       = aws_iam_role.argo_workflows[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_role_policy_attachment" "argo_workflows_s3" {
  # Indexed with 0 becase of the count argument inside the resource.
  role       = aws_iam_role.argo_workflows[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
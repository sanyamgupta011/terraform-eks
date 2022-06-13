resource "aws_eks_cluster" "myeks" {
  name     = "myeks"
  role_arn = aws_iam_role.myrole.arn

  vpc_config {
    subnet_ids = [aws_subnet.subnet1.id , aws_subnet.subnet2.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  ]
}

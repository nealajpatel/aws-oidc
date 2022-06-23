resource "aws_iam_role" "github_main" {
  name                 = "github-main-role"
  assume_role_policy   = data.aws_iam_policy_document.assume_role_main.json
  description          = "Role used by GitHub Action triggers on main branch."
  max_session_duration = var.max_session_duration
  tags                 = var.tags
}

resource "aws_iam_role" "github_pull_request" {
  name                 = "github-pull-request-role"
  assume_role_policy   = data.aws_iam_policy_document.assume_role_pull_request.json
  description          = "Role used by GitHub Action triggers on pull request."
  max_session_duration = var.max_session_duration
  tags                 = var.tags
}

resource "aws_iam_role_policy_attachment" "admin" {
  policy_arn = "arn:${local.partition}:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.github_main.id
}

resource "aws_iam_role_policy_attachment" "read_only" {
  policy_arn = "arn:${local.partition}:iam::aws:policy/ReadOnlyAccess"
  role       = aws_iam_role.github_pull_request.id
}

resource "aws_iam_role_policy_attachment" "ecr_full_access" {
  policy_arn = "arn:${local.partition}:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.github_pull_request.id
}

resource "aws_iam_openid_connect_provider" "github" {
  client_id_list  = ["https://github.com/${var.github_organization}", "sts.amazonaws.com"]
  tags            = var.tags
  thumbprint_list = [var.github_thumbprint]
  url             = "https://token.actions.githubusercontent.com"
}
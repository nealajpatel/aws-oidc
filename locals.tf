locals {
  partition        = data.aws_partition.current.partition
  github_main_refs = [for repo in var.github_repositories : "repo:${var.github_organization}/${repo}:ref:refs/heads/main"]
  github_pr_refs   = [for repo in var.github_repositories : "repo:${var.github_organization}/${repo}:pull_request"]
}
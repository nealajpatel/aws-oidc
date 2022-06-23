variable "github_organization" {
  description = "GitHub organization."
  type        = string
  default     = "alliebarnett44"
}

variable "github_repositories" {
  description = "List of GitHub repositories."
  type        = list(string)
  default     = ["aws-oidc"]
}

variable "github_thumbprint" {
  description = "GitHub OpenID TLS certificate thumbprint."
  type        = string
  default     = "6938fd4d98bab03faadb97b34396831e3780aea1"

}

variable "max_session_duration" {
  description = "Maximum session duration in seconds."
  type        = number
  default     = 3600

  validation {
    condition     = var.max_session_duration >= 3600 && var.max_session_duration <= 43200
    error_message = "Maximum session duration must be between 1 and 12 hours."
  }
}

variable "tags" {
  description = "Tags to be applied to resources."
  type        = object({})
  default = {
    project      = "aws-oidc"
    organization = "alliebarnett44"
  }
}
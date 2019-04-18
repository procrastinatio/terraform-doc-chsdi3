variable "account_name" {
  default = "aws-admin-test-1"
}

variable "github_org" {
  default = "swisstopo-test"
}

variable "account_id" {

}

variable "github_token" {

}


variable "project" {
	default = "terraform-doc-chsdi3"
}

variable "bucket" {
	default = "terraform-doc-chsdi3"
}

variable "artifact-bucket" {
	default = "terraform-doc-chsdi3"
}

variable "repository" {
    default = "doc-chsdi3"
}

variable "docker_build_image" {
   # default = "ubuntu"
   # default = "aws/codebuild/eb-go-1.6-amazonlinux-64:2.3.2"
   default = "aws/codebuild/standard:1.0"
}



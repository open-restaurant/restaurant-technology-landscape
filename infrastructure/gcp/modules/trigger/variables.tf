variable "branch" {}
variable "cloudbuild" {}
variable "description" {}
variable "include" {
  type    = list(string)
  default = []
}
variable "name" {}
variable "owner" {}
variable "project_id" {}
variable "repository" {}
variable "substitutions" {
  type = map(string)
}

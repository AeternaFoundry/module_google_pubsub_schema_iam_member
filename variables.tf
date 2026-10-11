variable "pubsub_schema_iam_members" {
  description = <<EOT
Map of pubsub_schema_iam_members, attributes below
Required:
    - member
    - role
    - schema
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member  = string
    role    = string
    schema  = string
    project = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}


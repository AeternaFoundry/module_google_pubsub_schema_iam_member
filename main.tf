resource "google_pubsub_schema_iam_member" "pubsub_schema_iam_members" {
  for_each = var.pubsub_schema_iam_members

  member  = each.value.member
  role    = each.value.role
  schema  = each.value.schema
  project = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}


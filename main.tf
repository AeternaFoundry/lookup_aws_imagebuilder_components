data "aws_imagebuilder_components" "imagebuilder_components_lookup" {
  for_each = var.imagebuilder_components_lookup

  owner  = each.value.owner
  region = each.value.region

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}


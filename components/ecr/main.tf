#
# -- ECR • Repositories
#
resource "aws_ecr_repository" "repo" {
  count = length(var.ecr__repos)

  name = var.ecr__repos[count.index].name
  image_tag_mutability = var.ecr__repos[count.index].image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.ecr__repos[count.index].scan_on_push
  }

  tags = merge(
    var.default_tags,
    {
      Name = format("%s", var.ecr__repos[count.index].name)
    }
  )
}

output "registries_ids" {
  value = aws_ecr_repository.repo.*.registry_id
}

output "repositories_urls" {
  value = aws_ecr_repository.repo.*.repository_url
}

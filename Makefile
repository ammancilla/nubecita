default: shell

shell:
	docker run -ti --rm \
		-v $(PWD):/home/nubecita:cached \
		-v ~/.aws:/root/.aws:cached \
		-v ~/.terraform.d:/root/.terraform.d:cached \
		-w /home/nubecita --entrypoint=/bin/sh \
		hashicorp/terraform:light

plan: cmd=plan
plan: terraform

apply: cmd=apply
apply: terraform

destroy: cmd=destroy
destroy: terraform

terraform:
	docker run -i --rm \
		-v $(PWD):/home/nubecita \
		-v ~/.aws:/root/.aws:cached \
		-v ~/.terraform.d:/root/.terraform.d:cached \
		-w /home/nubecita --entrypoint=/bin/sh \
		hashicorp/terraform:light ./bin/terraform $(cmd) $(component) $(environment)

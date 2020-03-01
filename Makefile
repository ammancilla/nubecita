default: shell

shell:
	docker run -ti --rm -v $(PWD):/home/nubecita:cached -v ~/.aws:/root/.aws:cached -w /home/nubecita --entrypoint=/bin/sh hashicorp/terraform

terraform:
	docker run -i --rm \
		-v $(PWD):/home/nubecita:cached \
		-v ~/.aws:/root/.aws:cached \
		-w /home/nubecita/components/$(component) \
		hashicorp/terraform $(cmd) -var="environment=$(environment)" -var-file="vars/$(environment).tfvars"

plan: cmd=plan
plan: terraform

apply: cmd=apply
apply: terraform

destroy: cmd=destroy
destroy: terraform

default: shell

shell:
	docker run -ti --rm \
		-v $(PWD):/home/nubecita:cached \
		-v ~/.aws:/root/.aws:cached \
		-v ~/.terraform.d:/root/.terraform.d:cached \
		-w /home/nubecita --entrypoint=/bin/sh \
		hashicorp/terraform:light

terraform:
	docker run -i --rm \
		-v $(PWD):/home/nubecita \
		-v ~/.aws:/root/.aws:cached \
		-v ~/.terraform.d:/root/.terraform.d:cached \
		-w /home/nubecita/components/$(component) \
		hashicorp/terraform:light $(cmd) \
		-var-file="vars/$(environment).tfvars"

plan: cmd=plan
plan: terraform

apply: cmd=apply
apply: terraform

destroy: cmd=destroy
destroy: terraform


#
# Wait, why is this needed?
#
# Good you asked. I'll let terraform asnwer:
#
# Error: Invalid for_each argument
#
#  117:   for_each = data.aws_subnet_ids.public.ids
#
# The "for_each" value depends on resource attributes that cannot be determined
# until apply, so Terraform cannot predict how many instances will be created.
# To work around this, use the -target argument to first apply only the
# resources that the for_each depends on.
#
terraform-networking:
	docker run -i --rm \
		-v $(PWD):/home/nubecita \
		-v ~/.aws:/root/.aws:cached \
		-v ~/.terraform.d:/root/.terraform.d:cached \
		-w /home/nubecita/components/networking \
		hashicorp/terraform:light $(cmd) \
		-var-file="vars/$(environment).tfvars" \
		-target="module.networking.aws_vpc.nubecita" \
		-target="module.networking.aws_subnet.public" \
		-target="module.networking.aws_subnet.private" \
		-target="module.networking.aws_route_table.public" \
		-target="module.networking.aws_internet_gateway.igw"


plan-networking: cmd=plan
plan-networking: terraform-networking

apply-networking: cmd=apply
apply-networking: terraform-networking

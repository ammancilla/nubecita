default: shell

shell:
	docker run -ti -v $PWD:/home/nubecita:cached  -w /home/nubecita --rm --entrypoint=/bin/sh hashicorp/terraform

plan:
	docker run -v $PWD:/home/nubecita  -w /home/nubecita --rm  hashicorp/terraform plan

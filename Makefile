.PHONY: deploy destroy

deploy:
	-sudo apt-get update
	cd `pwd`/terraform/bucket_storage && terraform init
	cd `pwd`/terraform/bucket_storage && terraform plan
	cd `pwd`/terraform/bucket_storage && terraform apply -auto-approve
	cd `pwd`/terraform/infra && terraform init
	cd `pwd`/terraform/infra && terraform plan
	cd `pwd`/terraform/infra && terraform apply -auto-approve
	./wait-provision.sh
	ansible-playbook -i `pwd`/shared/hosts `pwd`/ansible/ansible-k8s-cluster.yaml

destroy:
	cd `pwd`/terraform/infra && terraform plan
	cd `pwd`/terraform/infra && terraform destroy -auto-approve
	# cd `pwd`/terraform/bucket_storage && terraform plan
	# cd `pwd`/terraform/bucket_storage && terraform destroy -auto-approve

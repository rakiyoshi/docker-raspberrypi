awslogs: ./awslogs/cloudbuild.yaml ./awslogs/src/awslogs-agent-setup.py
	cloud-build-local \
		--config=./awslogs/cloudbuild.yaml \
		--dryrun=false \
		--push ./awslogs/

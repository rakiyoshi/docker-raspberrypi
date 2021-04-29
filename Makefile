awslogs: ./awslogs/cloudbuild.yaml ./awslogs/src/awslogs-agent-setup.py
	cloud-build-local \
		--config=./awslogs/cloudbuild.yaml \
		--dryrun=false \
		--push ./awslogs/

.PHONY: fluentd
fluentd: ./fluentd/cloudbuild.yaml ./fluentd/entrypoint.sh ./fluentd/fluent.conf
	cloud-build-local \
		--config=./fluentd/cloudbuild.yaml \
		--dryrun=false \
		--push ./fluentd/

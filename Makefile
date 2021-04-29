.PHONY: fluentd
fluentd: ./fluentd/cloudbuild.yaml ./fluentd/entrypoint.sh ./fluentd/fluent.conf
	cloud-build-local \
		--config=./fluentd/cloudbuild.yaml \
		--dryrun=false \
		--push ./fluentd/

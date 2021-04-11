build:
	cloud-build-local \
		--config=cloudbuild.yaml \
		--dryrun=false \
		--push .

build:
	rm -rf public
	hugo


deploy: build
	aws s3 sync public/ s3://pecs.owens.fyi --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E2S884DGFTSY56 --paths '/*'

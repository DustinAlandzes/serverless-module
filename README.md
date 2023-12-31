# serverless-module
[![frontend-build-and-deploy](https://github.com/DustinAlandzes/serverless-module/actions/workflows/frontend.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-module/actions/workflows/frontend.yml)
[![backend-build-and-test](https://github.com/DustinAlandzes/serverless-module/actions/workflows/backend.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-module/actions/workflows/backend.yml)
[![Terraform linting](https://github.com/DustinAlandzes/serverless-module/actions/workflows/terraform-linting.yml/badge.svg)](https://github.com/DustinAlandzes/serverless-module/actions/workflows/terraform-linting.yml)


AWS Serverless module using Terraform, a React/TypeScript frontend hosted on S3, and a Chalice/AWS Lambda backend.

## URLS
* frontend cloudfront distribution: https://d3ibzyj917g42s.cloudfront.net/
* frontend S3 Bucket: http://serverless-module20231216202918611500000001.s3-website-us-west-2.amazonaws.com/
* backend: https://9komogf4ce.execute-api.us-west-2.amazonaws.com/api/graphql

## Terraform
* [Terraform Cloud](https://developer.hashicorp.com/terraform/cloud-docs)
* Cloudfront Distribution, S3 Bucket, IAM User to access the bucket
* AWS Lambda config generated with chalice behind an API Gateway

## Frontend
* [Vite](https://vitejs.dev/guide/), [React](https://react.dev/reference/react), [TypeScript](https://www.typescriptlang.org/docs/)
* [Mantine](https://mantine.dev/getting-started/)
* [React Router](https://reactrouter.com/en/main)
* [S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide//Welcome.html)
* [Cloudfront](https://docs.aws.amazon.com/cloudfront/#lang/en_us) for HTTPS

## Backend
* [Python 3](https://docs.python.org/3/)
* [Black](https://black.readthedocs.io/en/stable/), [pytest](https://docs.pytest.org/en/7.4.x/)
* [Chalice](https://aws.github.io/chalice/index.html), [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
* [Strawberry](https://strawberry.rocks/docs), GraphQL
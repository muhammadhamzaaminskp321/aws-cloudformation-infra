#!/bin/bash

echo "Deploying VPC..."
aws cloudformation deploy \
  --stack-name dev-vpc-stack \
  --template-file templates/vpc.yml \
  --capabilities CAPABILITY_NAMED_IAM

echo "Deploying S3..."
aws cloudformation deploy \
  --stack-name dev-s3-stack \
  --template-file templates/s3.yml \
  --capabilities CAPABILITY_NAMED_IAM

echo "Deploying ECR..."
aws cloudformation deploy \
  --stack-name dev-ecr-stack \
  --template-file templates/ecr.yml \
  --capabilities CAPABILITY_NAMED_IAM

echo "Deploying ECS..."
aws cloudformation deploy \
  --stack-name dev-ecs-stack \
  --template-file templates/ecs.yml \
  --parameter-overrides file://parameters/dev-params.json \
  --capabilities CAPABILITY_NAMED_IAM

echo "Deploying ALB..."
aws cloudformation deploy \
  --stack-name dev-alb-stack \
  --template-file templates/alb.yml \
  --parameter-overrides file://parameters/dev-params.json \
  --capabilities CAPABILITY_NAMED_IAM

echo "Deploying RDS..."
aws cloudformation deploy \
  --stack-name dev-rds-stack \
  --template-file templates/rds.yml \
  --parameter-overrides file://parameters/dev-params.json \
  --capabilities CAPABILITY_NAMED_IAM

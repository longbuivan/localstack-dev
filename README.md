# Deploy AWS Lambda Functions to Local Environments with Terraform 
Using terraform to deploy Mock AWS Infrastructure for development purpose.
# Prerequisite
- Docker
- Terraform
- AWS CLI
# Setup
- Create localstack-external network for docker
- Docker-compose up to start localstack
- Terraform init for downloading providers
- Terraform plan for checking any change in current state
- Terraform apply for deploying code to Mock AWS
- Terraform destroy for kill Mock AWS resources

# Execution
- Interacte with s3 via CLI: aws --endpoint=http://localhost:4572 s3 [option] [arg] [object]
- Interacte with dynamodb via CLI: aws --endpoint=http://localhost:4569 dynamodb [option] [arg] [object]
- Interacte with iam via CLI: aws --endpoint=http://localhost:4593 iam [option] [arg] [object]
- Interacte with iam via CLI: aws --endpoint=http://localhost:4574 lambda [option] [arg] [object]
## Example
Invoke Lambda Function: aws --endpoint=http://localhost:4574 lambda invoke --function-name arn:aws:lambda:ap-southeast-2:000000000000:function:poc_lambda response.json
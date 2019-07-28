# PrivateSubnets&VPN

## Requirements
1.  S3 Bucket to store `tfstate`
2.  DynamoDB table to perform Infrastructure lock
3.  Terraform > 0.12

## Architecture
### IPv4
![Architecture Diagram for IPv4](https://docs.aws.amazon.com/es_es/vpc/latest/userguide/images/Case4_Diagram.png "Architecture Diagram for IPv4")

### IPv6 Enabled
![Architecture Diagram](https://docs.aws.amazon.com/es_es/vpc/latest/userguide/images/scenario-4-ipv6-diagram.png "Architecture Diagram with IPv6 Enabled")
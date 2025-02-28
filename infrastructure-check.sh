#!/bin/bash

echo "🔍 Checking AWS Infrastructure..."

echo "---------------------------------"
echo "✅ Checking VPC..."
aws ec2 describe-vpcs --query "Vpcs[*].VpcId" --output table

echo "---------------------------------"
echo "✅ Checking Subnets..."
aws ec2 describe-subnets --query "Subnets[*].[SubnetId,AvailabilityZone]" --output table

echo "---------------------------------"
echo "✅ Checking ALB..."
aws elbv2 describe-load-balancers --query "LoadBalancers[*].[LoadBalancerName,DNSName]" --output table

echo "---------------------------------"
echo "✅ Checking ALB Listeners..."
aws elbv2 describe-listeners --query "Listeners[*].[ListenerArn,Port]" --output table

echo "---------------------------------"
echo "✅ Checking Security Groups..."
aws ec2 describe-security-groups --query "SecurityGroups[*].[GroupId,GroupName]" --output table

echo "---------------------------------"
echo "✅ Checking RDS..."
aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,DBInstanceStatus]" --output table

echo "---------------------------------"
echo "✅ Checking Prometheus..."
curl -Is http://44.204.91.164:9090 | grep HTTP

echo "---------------------------------"
echo "✅ Checking Grafana..."
curl -Is http://44.204.91.164:3000 | grep HTTP

echo "---------------------------------"
echo "✅ Checking Jenkins..."
curl -Is http://44.204.91.164:8080 | grep HTTP

echo "---------------------------------"
echo "🛑 Infrastructure Recheck Completed 🔥"

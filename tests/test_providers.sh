#!/bin/bash
set -euo pipefail

# Test Engine and plugins
echo "-- shared provider"
hamlet -i mock -p sharedtest -p shared -f default deploy test-deployments

echo "-- aws provider"
hamlet -i mock -p aws -p awstest -f cf deploy test-deployments

echo "-- azure provider"
hamlet -i mock -p azure -p azuretest -f arm deploy test-deployments

#!/bin/bash
set -euo pipefail

# Create a CMDB
echo "-- cmdb build"
test_cmdb="$(mktemp -d)"

tenant="test_ten1"
account="test_acct1"
product="test_product1"
provider_id="1234567890"

environment="integration"
segment="default"

touch ${test_cmdb}/root.json
hamlet generate tenant-cmdb -o "${test_cmdb}" --tenant-id "${tenant}" --use-default --no-prompt
hamlet generate account-cmdb -o "${test_cmdb}/${tenant}" --account-id "${account}" --provider-id "${provider_id}" --use-default --no-prompt
hamlet generate product-cmdb -o "${test_cmdb}"  --product-id "${product}" --use-default --no-prompt


cd ${test_cmdb}/${product}/config/solutionsv2/${environment}/${segment}/
hamlet --account "${account}" component list-occurrences

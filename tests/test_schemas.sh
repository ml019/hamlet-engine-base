#!/bin/bash
set -euo pipefail

# Create Schemas
echo "-- schemas"

schema_dir="$(mktemp -d)"
hamlet -i mock -p shared -p aws -p azure -p diagrams schema create-schemas -o "${schema_dir}"

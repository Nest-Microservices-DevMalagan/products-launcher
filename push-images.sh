#!/bin/bash

REGISTRY="us-east4-docker.pkg.dev/ecommerce-microserivces/nestjs-ecommerce-registry"
SERVICES=("auth-ms" "client-gateway" "orders-ms" "payments-ms" "products-ms")

for SERVICE in "${SERVICES[@]}"; do
  docker image push "$REGISTRY/$SERVICE"
done


podman run --rm     -v $PWD:/local openapitools/openapi-generator-cli generate    \
       -i /local/tempo-core.yaml     -g ruby     -o /local/out/ruby

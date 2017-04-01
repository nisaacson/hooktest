env
set -e

echo "HASH: \"$HASH\""
echo "CODEBUILD_BUILD_ID: \"$CODEBUILD_BUILD_ID\""
echo "INSTALLATION_ID: \"$INSTALLATION_ID\""
PAYLOAD="{\"state\": \"success\", \"id\": \"$CODEBUILD_BUILD_ID\", \"region\": \"$AWS_REGION\"}"

echo "payload is: $PAYLOAD"
curl -XPOST --data "$PAYLOAD" "https://api.deploytoproduction.com/status" -v
echo "build status complete"

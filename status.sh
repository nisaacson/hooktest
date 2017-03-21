env
set -e

echo "HASH: \"$HASH\""
echo "CODEBUILD_BUILD_ID: \"$CODEBUILD_BUILD_ID\""
echo "INSTALLATION_ID: \"$INSTALLATION_ID\""

curl \
  -XPOST \
  "https://codereview.dev.api.nisaacson.com/status" -v \
  --data {"state": "success", "id": "$CODEBUILD_BUILD_ID", "region": "$AWS_REGION"}

echo "build status complete"

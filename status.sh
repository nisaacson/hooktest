env
echo "HASH: \"$HASH\""
echo "CODEBUILD_BUILD_ID: \"$CODEBUILD_BUILD_ID\""
echo "INSTALLATION_ID: \"$INSTALLATION_ID\""
PAYLOAD="{\"state\": \"success\", \"id\": \"$CODEBUILD_BUILD_ID\", \"region\": \"$AWS_REGION\"}"

echo "payload is: $PAYLOAD"
curl -XPOST --data "$PAYLOAD" "https://05veg8ph09.execute-api.us-west-2.amazonaws.com/dev/status"
echo "build status complete"

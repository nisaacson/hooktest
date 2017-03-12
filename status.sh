env
echo "HASH: \"$HASH\""
echo "INSTALLATION_ID: \"$INSTALLATION_ID\""
cat > payload.json <<EOF
{
  "hash": "$HASH",
  "state": "success",
  "installationId": "$INSTALLATION_ID",
  "build": {
    "id": "$CODEBUILD_BUILD_ID",
    "url": "https://$AWS_REGION.console.aws.amazon.com/codebuild/home?region=$AWS_REGION#/builds/$CODEBUILD_BUILD_ID/view/new"
  },
  "repo_full_name": "$REPO_FULL_NAME"
}
EOF

echo "payload is:"
cat payload.json
echo "post data"
curl --request POST \
  --url "https://05veg8ph09.execute-api.us-west-2.amazonaws.com/dev/status" \
  --header 'content-type: application/json' \
  --data @payload.json
echo "build status complete"
rm payload.json

env
echo "HASH: \"$HASH\""
echo "CODEBUILD_BUILD_ID: \"$CODEBUILD_BUILD_ID\""
echo "INSTALLATION_ID: \"$INSTALLATION_ID\""
cat > payload.json <<EOF
{
  "id": "$CODEBUILD_BUILD_ID",
  "region": "AWS_REGION"
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

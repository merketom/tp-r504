a=$(cat ~/token.gh)

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $a" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/merketom/graphes/actions/artifacts \
  > gh-artifacts.json

curl -L \
  --output artifact.zip \
  -H "Accept: application/vnd.github+zip" \
  -H "Authorization: Bearer $a" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/merketom/graphes/actions/artifacts/4329917168/zip

unzip artifact.zip

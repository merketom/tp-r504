a=$(cat ~/token.gh)

while read id; do
  curl -L \
    -H "Accept: application/vnd.github+zip" \
    -H "Authorization: Bearer $a" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    -o "artifact-${id}.zip" \
    "https://api.github.com/repos/merketom/graphes/actions/artifacts/${id}/zip"

  unzip -o "artifact-${id}.zip" -d "artifact-${id}"
done < liste-id.txt


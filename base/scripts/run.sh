set -e

cd /built_app

export PORT=8080
echo "=> Starting meteor app on port:$PORT"
node main.js

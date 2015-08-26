set -e

COPIED_APP_PATH=/copied-app
BUNDLE_DIR=/tmp/bundle-dir

# Make sure copied folder doesn't cause any issues
cp -R /app $COPIED_APP_PATH
cd $COPIED_APP_PATH

meteor build --directory $BUNDLE_DIR

cd $BUNDLE_DIR/bundle/programs/server/
npm install

mv $BUNDLE_DIR/bundle /built_app

# Cleanup
rm -rf $COPIED_APP_PATH
rm -rf $BUNDLE_DIR
rm -rf ~/.meteor
rm /usr/local/bin/meteor

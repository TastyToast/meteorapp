#!/bin/bash
set -e

bash $METEOR_DIR/lib/install_meteor.sh
bash $METEOR_DIR/lib/build_meteor_app.sh

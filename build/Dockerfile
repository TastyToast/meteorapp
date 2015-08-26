FROM donnieconner/meteorapp:base

ONBUILD COPY ./ /app
ONBUILD RUN bash $METEOR_DIR/build.sh

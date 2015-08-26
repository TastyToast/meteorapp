FROM google/nodejs

ENV METEOR_DIR /opt/meteorapp
COPY scripts $METEOR_DIR

ENV DISABLE_WEBSOCKETS 1

RUN bash $METEOR_DIR/init.sh

ENTRYPOINT bash $METEOR_DIR/run.sh

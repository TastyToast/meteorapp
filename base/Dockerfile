FROM google/nodejs

ENV METEOR_DIR /opt/meteorapp
COPY scripts $METEOR_DIR

RUN bash $METEOR_DIR/init.sh

ENTRYPOINT bash $METEOR_DIR/run.sh

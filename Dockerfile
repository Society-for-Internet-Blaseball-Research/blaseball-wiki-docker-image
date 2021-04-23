FROM mediawiki:stable

RUN apt-get update && apt-get install -y --no-install-recommends \
    less \
    vim \
    wget

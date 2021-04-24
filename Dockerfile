FROM mediawiki:stable

RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-freefont-ttf \
    less \
    vim \
    wget

# ploticus isn't available in Debian stable
RUN curl -L https://downloads.sourceforge.net/project/ploticus/ploticus/2.42/ploticus242_linuxbin64.tar.gz | tar -C /usr/local/bin -xzf - ploticus242/bin/pl --strip-components=2

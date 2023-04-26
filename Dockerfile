FROM mediawiki:1.35

RUN apt-get update && apt-get install -y --no-install-recommends \
    cron \
    fonts-freefont-ttf \
    less \
    vim \
    wget

# ploticus isn't available in Debian stable
RUN curl -L https://downloads.sourceforge.net/project/ploticus/ploticus/2.42/ploticus242_linuxbin64.tar.gz | tar -C /usr/local/bin -xzf - ploticus242/bin/pl --strip-components=2

RUN a2enmod headers
RUN a2enmod remoteip
COPY remoteip.conf /etc/apache2/conf-available
RUN a2enconf remoteip

COPY init.sh /usr/local/bin

CMD ["bash", "/usr/local/bin/init.sh"]

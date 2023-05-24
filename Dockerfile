FROM mediawiki:1.39

RUN apt-get update && apt-get install -y --no-install-recommends \
    cron \
    fonts-freefont-ttf \
    less \
    ploticus \
    vim \
    wget

RUN a2enmod headers
RUN a2enmod remoteip
COPY remoteip.conf /etc/apache2/conf-available
RUN a2enconf remoteip

COPY init.sh /usr/local/bin

CMD ["bash", "/usr/local/bin/init.sh"]

FROM phpdockerio/php72-fpm:latest
WORKDIR "/application/"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive
ARG APPLICATION_ENV='prod'

# settings
ENV COMPOSER_ALLOW_SUPERUSER=1

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php7.2-mysql php-redis php7.2-bcmath php7.2-bz2 php7.2-gd php7.2-imap php7.2-intl php7.2-soap php-ssh2 php7.2-xmlrpc php7.2-xsl php-yaml

RUN if [ ${APPLICATION_ENV} = 'dev' ]; then \
    apt-get -y --no-install-recommends install php-xdebug \
    && echo "xdebug.remote_enable=on" >> /etc/php/7.2/fpm/conf.d/20-xdebug.ini \
    && echo "xdebug.force_display_errors=1" >> /etc/php/7.2/fpm/conf.d/20-xdebug.ini \
    && echo "xdebug.extended_info=1" >> /etc/php/7.2/fpm/conf.d/20-xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /etc/php/7.2/fpm/conf.d/20-xdebug.ini \
;fi

# opcache and cache settings
RUN if [ ${APPLICATION_ENV} = 'prod' ]; then \
    echo "opcache.validate_timestamps=0" >> /etc/php/7.2/fpm/conf.d/10-opcache.ini \
    && echo "realpath_cache_size=4096K" >> /etc/php/7.2/fpm/conf.d/10-opcache.ini \
    && echo "realpath_cache_ttl=600" >> /etc/php/7.2/fpm/conf.d/10-opcache.ini \
;fi

# Install git
RUN apt-get update \
    && apt-get -y install git unzip gzip \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version \
    && composer global require hirak/prestissimo

RUN  if [ ${APPLICATION_ENV} = 'dev' ]; then \
    composer global require squizlabs/php_codesniffer ~2.0 \
    && composer global require endouble/symfony3-custom-coding-standard \
    && /root/.composer/vendor/bin/phpcs --config-set installed_paths /root/.composer/vendor/endouble/symfony3-custom-coding-standard \
;fi

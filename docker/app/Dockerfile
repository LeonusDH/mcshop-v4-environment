FROM phpdockerio/php72-fpm:latest
WORKDIR "/application/"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive
# settings
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PHP_IDE_CONFIG="serverName=application"

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install  php7.2-mysql php-redis php-xdebug php7.2-bcmath php7.2-bz2 php7.2-gd php7.2-imap php7.2-intl php7.2-soap php-ssh2 php7.2-xmlrpc php7.2-xsl php-yaml \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install git
RUN apt-get update \
    && apt-get -y install git unzip gzip \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

	
# composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
RUN composer global require hirak/prestissimo
RUN composer global require squizlabs/php_codesniffer ~2.0
RUN composer global require endouble/symfony3-custom-coding-standard
RUN /root/.composer/vendor/bin/phpcs --config-set installed_paths /root/.composer/vendor/endouble/symfony3-custom-coding-standard

FROM debian:buster

RUN apt-get update \
  && apt-get install -y --no-install-recommends apt-transport-https lsb-release ca-certificates curl software-properties-common gnupg2 git zip unzip \
  && apt-get update \
  && apt-get install -y --no-install-recommends php7.3 php7.3-common php7.3-cli php7.3-fpm php7.3-mysql php7.3-gd php7.3-soap php7.3-ldap php7.3-intl php7.3-xml php7.3-mbstring php php7.3-zip php7.3-curl php7.3-apcu php7.3-xdebug \
  && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('sha384', 'composer-setup.php') === 'c5b9b6d368201a9db6f74e2611495f369991b72d9c8cbd3ffbc63edff210eb73d46ffbfce88669ad33695ef77dc76976') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php --install-dir=bin  --filename=composer \
  && composer global require hirak/prestissimo \
  && curl -sL https://deb.nodesource.com/setup_13.x | bash - \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
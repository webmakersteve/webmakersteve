FROM node:6

# Make ghost directory to source the files
RUN mkdir -p /var/www/ghost

# Install Ghost CLI
RUN npm i -g --no-progress --quiet --production ghost-cli

# Set workdir to that directory
WORKDIR /var/www/ghost

# Install it
RUN ghost install --no-prompt --pname webmakersteve --no-stack --db sqlite3 --url http://localhost --no-start local

RUN sed s/127.0.0.1/0.0.0.0/g  config.development.json > config.production.json

EXPOSE 2368

VOLUME /var/www/ghost/content/data

CMD ghost run
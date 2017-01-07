FROM node

MAINTAINER Christian Gripp <mail@core23.de>

# Sass
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    ruby \
    ruby-dev

# Compass
RUN gem install \
    sass \
    compass

# Gulp
RUN npm install gulp -g

# Directory for sources
WORKDIR /src

# Directory for build
WORKDIR /project

CMD ["gulp", "watch"]

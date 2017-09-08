FROM ruby:latest

RUN gem install rails

RUN gem install puma

RUN apt-get update

# Get latest nodejs PPA
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

# install nodejs and npm
RUN apt-get install -y nodejs

RUN mkdir /var/www

COPY . /var/www/dashboard

WORKDIR /var/www/dashboard

RUN bundle install

#### ENV variables
ENV REDIS_HOST redis_temp
ENV REDIS_PORT 6379

# compile assets
RUN rails assets:precompile



# run rails server
CMD rails server -b 0.0.0.0 -p 3000

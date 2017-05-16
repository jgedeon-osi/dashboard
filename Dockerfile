FROM ruby:latest

RUN gem install rails

RUN gem install puma

RUN apt-get update

# Get latest nodejs PPA
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

# install nodejs and npm
RUN apt-get install -y nodejs

# get latest yarn repo
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN mkdir /var/www; cd /var/www;

# clone dashboard
RUN git clone https://github.com/ca-cwds/dashboard.git /var/www/dashboard

WORKDIR /var/www/dashboard
RUN cd /var/www/dashboard

RUN bundle install

# compile assets
RUN rails assets:precompile

#### ENV variables

# run rails server
CMD rails server -b 0.0.0.0 -p 3000



FROM engineyard/kontainers:ruby-3.0.4-v1.0.0

RUN apt-get update -qq && apt-get install -y nodejs
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN gem install rails -v '5.2.7'
RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY ..

#RUN bundle exec rake db:migrate RAILS_ENV=development
#RUN bundle exec rake db:seed

EXPOSE 3000

CMD ls

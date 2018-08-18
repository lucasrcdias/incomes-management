FROM ruby:2.5.1
RUN mkdir /income-management
WORKDIR /income-management
ADD Gemfile /income-management/Gemfile
ADD Gemfile.lock /income-management/Gemfile.lock
RUN bundle
ADD . /income-management

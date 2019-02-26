FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && gem install bundler

RUN bundle config --global frozen 0

WORKDIR /myapp

COPY Gemfile /myapp

COPY Gemfile.lock /myapp

RUN bundle install

EXPOSE 3000

COPY . /myapp

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]



# comandos para startar o projeto
# criação da imagem:
#  docker build -t myapp .
# criação do container
#  docker run -itP -v $(pwd):/myapp -p 3009:3000 --name myapp_desenv myapp
#  docker run -it -v $(pwd):/myapp -p 3009:3000 --name myapp_desenv myapp
#  docker run -d -v $(pwd):/myapp -p 3009:3000 --name myapp_desenv myapp
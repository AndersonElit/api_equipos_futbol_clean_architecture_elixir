# build stage
FROM elixir:1.14.3-alpine
ENV APP_NAME=app
ENV MIX_ENV=prod
RUN apk add build-base git
WORKDIR /app
COPY mix.exs mix.lock /app/
RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix deps.get \
    && mix deps.compile
COPY . /app
RUN mkdir -p _build/prod/rel/$APP_NAME/releases/RELEASES \
    && mix distillery.release \
    && rm -rf /app/_build/prod/rel/$APP_NAME/etc

# runtime stage
FROM elixir:1.14.3-alpine
ENV APP_NAME=app
ENV MIX_ENV=prod
WORKDIR /app
EXPOSE 8083
RUN apk update && apk upgrade && apk add bash && mkdir -p /app/rel/$APP_NAME/var
COPY --from=0 /app/_build/prod /app
VOLUME /app/rel/$APP_NAME/etc
#USER #{elixir_user}#
ENTRYPOINT exec /app/rel/$APP_NAME/bin/$APP_NAME foreground

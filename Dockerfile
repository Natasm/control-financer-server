from elixir:latest

ADD . /app

WORKDIR app

RUN mix local.hex --force && mix local.rebar --force

RUN wget https://github.com/phoenixframework/archives/raw/master/phx_new.ez

RUN mix archive.install ./phx_new.ez --force

RUN rm ./phx_new.ez

# Install Elxir dependencies
RUN mix deps.get

# Compile files
RUN mix compile

# Expose port 4000
EXPOSE 4000
# Execute commands mentioned under run.sh file
CMD ["./run.sh"]
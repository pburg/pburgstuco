# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

# When deploying the application, set an environment variable named
# SECRET_TOKEN on the server. To generate a good secret key, run `rake secret`.

PburgStuCo::Application.config.secret_token =
  ENV["SECRET_TOKEN"] || File.read(
  Rails.root.join "config", "initializers", "development_secret_token"
).strip

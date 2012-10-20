# Simulate the public development server.
def set_development_server
  Rails.env, ENV["SERVER"] = %w[production development]
end

# Simulate the production server.
def set_production_server
  Rails.env = ENV["SERVER"] = "production"
end

# Simulates a local development environment. Pass in a code block with the code
# that you wish to run.
def in_local_development_environment(&block)
  Rails.env = "development"
  %w[development production].each do |server_env|
    ENV["SERVER"] = server_env
    yield
  end
end

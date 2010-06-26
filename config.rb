require 'sequel'

# Database connection.
DB = Sequel.connect 'sqlite://wind.db'

# Sequel schema plugin.
Sequel::Model.plugin :schema

# Database models.
Dir['models/*.rb'].each { |model| require model }

# Sinatra configurations.
configure do
  enable :sessions
end

# Application helpers.
helpers do
  Dir['helpers/*.rb'].each { |helper| require helper }
end

# Blog configurations.
$blog = Setting.from_database
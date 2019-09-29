# frozen_string_literal: true

require 'mysql2'

begin
  # Initialize connection variables.
  host = String('localhost')
  # host = String('Hooooome')
  database = String('sport_news')
  username = String('root')
  password = String('1qaz@WSX')

  # Initialize connection object.
  Mysql2::Client.new(host: host, username: username, database: database, password: password)
  puts 'Successfully created connection to database.'
end

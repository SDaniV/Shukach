require 'require_all'
require_all 'settings'

HOST = String('localhost').freeze
DATABASE = String('sport_news').freeze
USERNAME = String('root').freeze
PASSWORD = ProjectSettings::DB_PASSWORD

class SportNewsDB
  def initialize
    @sql_client = Mysql2::Client.new(
      host: HOST,
      database: DATABASE,
      username: USERNAME,
      password: PASSWORD
    )
    puts 'Successfully created connection to database.'
  end

  def close_db
    @sql_client&.close
    puts 'Database is successfully closed'
  end
end

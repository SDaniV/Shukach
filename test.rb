require_relative 'parser/sportua_parser.rb'
require_relative 'parser/sportanalytic_parser.rb'

begin
  sportua_parser = SportUAParser.new
  sportua_parser.load_driver
  sportua_parser.load_sportua
  sportua_parser.go_to_basketball_page
  p sportua_parser.get_main_news_title
end

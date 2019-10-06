require 'require_all'
require_all 'parser'
require_all 'db'

begin
  @football_table = FootballTable.new
  @football_table.clear_table

  sportua_parser = SportUAParser.new
  sportua_parser.load_sportua
  sportua_parser.go_to_basketball_page

  post_values = {}
  post_values[:title] = sportua_parser.get_newest_post_title
  post_values[:first_paragraph] = sportua_parser.get_first_paragraph
  post_values[:link] = sportua_parser.get_link_to_full_post
  post_values[:image_path] = sportua_parser.get_main_image

  @football_table.insert_post(post_values)
ensure
  @football_table.close_db
end

require 'require_all'
require_all 'parser'
require_all 'db'

begin
  football_page = SportUAFootballPage.new
  football_page.load_main_page
  football_page.go_to_football_page

  main_post_values = football_page.find_main_post_values
  first_popular_post = football_page.find_first_popular_post
  # second_popular_post =

  @football_table = FootballTable.new
  @football_table.clear_table
  @football_table.insert_post(main_post_values)
  @football_table.insert_post(first_popular_post)
ensure
  @football_table.close_db
end

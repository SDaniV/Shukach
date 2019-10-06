require 'telegram/bot'
require 'require_all'
require_all 'db'
require_all 'settings'

begin
  @football_table = FootballTable.new
  post_values = @football_table.select_post

  @title = post_values['title']
  @post_description = post_values['post_description']
  @image_path = post_values['image_path']

  Telegram::Bot::Client.run(ProjectSettings::TOKEN) do |bot|
    p "I'm listening"
    bot.api.send_photo(
      chat_id: ProjectSettings::MY_ID,
      photo: @image_path,
      caption: "#{@title}\n\n#{@post_description}"
    )
  end
ensure
  @football_table.close_db
end

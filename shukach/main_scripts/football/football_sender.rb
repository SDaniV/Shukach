require 'pry'
require 'telegram/bot'
require 'require_all'
require_all 'db'
require_all 'settings'

begin
  tracking_table = TrackingTable.new
  @football_table = FootballTable.new
  table_data = @football_table.select_post
  post_values = nil

  table_data.each do |post|
    post_values = post if tracking_table.already_used_id?(post['id']) == false
  end

  if post_values
    post_id = post_values['id']
    title = post_values['title']
    post_description = post_values['post_description']
    image_path = post_values['image_path']

    Telegram::Bot::Client.run(ProjectSettings::TOKEN) do |bot|
      p "I'm listening"
      bot.api.send_photo(
        chat_id: ProjectSettings::MY_ID,
        photo: image_path,
        caption: "#{title}\n\n#{post_description}"
      )
    end
    tracking_table.mark_id_as_used(post_id)
  else
    puts 'There are no new posts...'
  end
ensure
  @football_table.close_db
end

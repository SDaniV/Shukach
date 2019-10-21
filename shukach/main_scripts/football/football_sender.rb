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
    post_values = post if tracking_table.already_used_link?(post['link']) == false
  end

  if post_values
    post_id = post_values['id']
    title = post_values['title']
    post_description = post_values['post_description']
    image_path = post_values['image_path']
    link = post_values['link']

    Telegram::Bot::Client.run(ProjectSettings::TOKEN) do |bot|
      p "I'm listening"
      bot.api.send_photo(
        chat_id: ProjectSettings::MY_ID,
        photo: image_path,
        caption: "#{title}\n\n#{post_description}\n\nЗа детальнішою інформацією:\n\n#{link}"
      )
    end
    tracking_table.mark_link_as_used(link)
  else
    Telegram::Bot::Client.run(ProjectSettings::TOKEN) do |bot|
      p "I'm listening"
      bot.api.send_message(
        chat_id: ProjectSettings::MY_ID,
        text: 'There are no more actual news in database...'
      )
    end
  end
ensure
  @football_table.close_db
end

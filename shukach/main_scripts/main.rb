#coding UTF-8

require 'telegram/bot'
require 'require_all'
require_all '../parser'
require_all '../settings'
# require_relative 'parser/sportua_parser.rb'
# require_relative 'parser/sportanalytic_parser.rb'

TOKEN = TelegramSettings::TOKEN

TOPICS = ['Футбол', 'Волейбол']

Telegram::Bot::Client.run(TOKEN) do |bot|
  p "I'm listening"
  bot.listen do |message|
    case message.text
    when 'ftb'
      sportua_parser = SportUAParser.new
      title = sportua_parser.vse_na_kupu
      image = sportua_parser.get_main_image
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "#{title}"
      )
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "(#{image}) Image."
      )
    when 'football'
      sportua_parser = SportUAParser.new
      title = sportua_parser.vse_na_kupu
      image = sportua_parser.get_main_image
      bot.api.send_photo(
        chat_id: message.chat.id,
        photo: image,
        caption: title
      )
      sportanalytic_parser = SportAnalyticParser.new
      title = sportanalytic_parser.get_main_football_post
      image = sportanalytic_parser.get_main_post_image
      bot.api.send_photo(
        chat_id: message.chat.id,
        photo: image,
        caption: title
      )
    when 'bsk'
      sportua_parser = SportUAParser.new
      sportua_parser.load_driver
      sportua_parser.load_sportua
      sportua_parser.go_to_basketball_page
      post_title = sportua_parser.get_newest_post_title
      post_first_paragraph = sportua_parser.get_first_paragraph
      link = sportua_parser.get_link_to_full_post
      image = sportua_parser.get_main_image

      bot.api.send_photo(
        chat_id: message.chat.id,
        photo: image,
        caption: "#{post_title}\n\n#{post_first_paragraph}\n\nДетальніше за посиланням:\n\n#{link}"
      )
    end
  end  
end

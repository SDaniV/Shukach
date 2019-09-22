    when '/start', '/start start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Привіт, #{message.from.first_name}"
      )
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Обери тему, яка тебе цікавить: \n #{TOPICS}"
      )

      
# when 'football'
#   bot.api.send_photo(
#     chat_id: message.chat.id,
#     photo: Faraday::UploadIO.new('voronka.png', 'image/jpeg'))
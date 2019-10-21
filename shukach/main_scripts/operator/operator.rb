require 'telegram/bot'
require 'require_all'
require_all 'data'
require_all 'settings'

require_relative 'operator_actions.rb'

Telegram::Bot::Client.run(ProjectSettings::TOKEN) do |bot|
  p 'Operator is listening'
  bot.listen do |message|
    case message.text
    when 'hey'
      OperatorActions.add_user_into_db(message.chat.id)
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Привіт, #{message.from.first_name}"
      )
      bot.api.send_message(
        chat_id: message.chat.id,
        text: BotAnswers::INITIAL_INSTRUCTION
      )
    when 'topic'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: BotAnswers::AVAILABLE_TOPICS
      )
    when /(^[0-9][0-9]-[0-9][0-9])/
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "BotAnswers::SCHEDULE"
      )
    when 'time'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: BotAnswers::SCHEDULE
      )
    when 'ftb'
      OperatorActions.save_user_category(message.chat.id, message.text)
      bot.api.send_message(
        chat_id: message.chat.id,
        text: 'Категорію football успішно встановлено'
      )
    when 'bsk'
      OperatorActions.save_user_category(message.chat.id, message.text)
      bot.api.send_message(
        chat_id: message.chat.id,
        text: 'Категорію basketball успішно встановлено'
      )
    end
  end
end

require 'require_all'

require_all 'db'

module OperatorActions
  def self.add_user_into_db(user_id)
    user_settings = UserSettingsTable.new
    user_settings.add_user_id(user_id)
    user_settings.close_db
  end

  def self.save_user_category(user_id, category)
    user_settings = UserSettingsTable.new
    user_settings.put_user_category(user_id, category)
    user_settings.close_db
  end
end

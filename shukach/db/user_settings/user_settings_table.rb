require 'mysql2'
require 'require_all'
require_all 'db'

class UserSettingsTable < SportNewsDB
  def add_user_id(user_id)
    add_user_id = "INSERT INTO user_settings(user_id) VALUES('#{user_id}')"
    exists = false
    @sql_client.query('SELECT * FROM user_settings').each do |row|
      exists = true if row['user_id'] == user_id
    end
    p "User id #{user_id} already exists in db"
    @sql_client.query(add_user_id) unless exists
  end

  def put_user_category(user_id, category)
    query = 'UPDATE sport_news.user_settings ' \
            "SET category = \'#{category}\' WHERE user_id = #{user_id};"
    @sql_client.query(query)
  end

  def mark_link_as_used(link)
    @sql_client.query("INSERT INTO tracking(UsedLink) VALUES('#{link}')")
  end

  def already_used_link?(link)
    used = false
    @sql_client.query('SELECT * FROM tracking').each do |row|
      used = true if row['UsedLink'] == link
    end
    used
  end
end

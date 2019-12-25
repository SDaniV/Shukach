require 'mysql2'
require 'require_all'
require_all 'db'

class TrackingTable < SportNewsDB
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

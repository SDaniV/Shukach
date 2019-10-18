require 'mysql2'
require 'require_all'
require_all 'db'

class TrackingTable < SportNewsDB
  def mark_id_as_used(id)
    @sql_client.query("INSERT INTO tracking(PostID) VALUES('#{id}')")
  end

  def already_used_id?(id)
    used = false
    @sql_client.query('SELECT * FROM tracking').each do |row|
      used = true if row['PostID'] == id
    end
    used
  end
end

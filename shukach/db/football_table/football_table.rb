require 'mysql2'
require 'require_all'
require_all 'db'

class FootballTable < SportNewsDB
  def insert_post(values)
    @sql_client.query("INSERT INTO football_news(title, post_description, image_path, link) VALUES('#{values[:title]}', '#{values[:first_paragraph]}', '#{values[:image_path]}', '#{values[:link]}')")
  end

  def select_post
    table_data = []
    @sql_client.query('SELECT * FROM football_news').each do |row|
      table_data << row
    end
    table_data
  end

  def clear_table
    @sql_client.query('DELETE FROM football_news;')
  end
end

require 'require_all'
require_all 'db'

require 'mysql2'

class FootballTable < SportNewsDB
  def insert_post(values)
    @sql_client.query("INSERT INTO football_news(title, post_description, image_path) VALUES('#{values[:title]}', '#{values[:first_paragraph]}', '#{values[:image_path]}')")
  end

  def select_post
    post_values = nil
    @sql_client.query('SELECT * FROM football_news').each do |row|
      post_values = row
    end
    post_values
  end

  def clear_table
    @sql_client.query('DELETE FROM football_news;')
  end
end

# query = %{
# INSERT INTO football_news(title, post_description, image_path)
#          VALUES('#{values[:title]}',
#                 '#{values[:first_paragraph]}',
#                 '#{values[:image_path]}')
# }.gsub(/\s+/, ' ').strip
# @sql_client.query

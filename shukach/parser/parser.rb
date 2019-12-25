class Parser
  def initialize
    @driver = Driver.new
  end

  def load_main_page
    raise 'Failed to load main page'
  end

  def go_to_football_page
    raise 'Failed to open football page'
  end

  def find_main_post_title
    raise 'Failed to find main post title'
  end
end

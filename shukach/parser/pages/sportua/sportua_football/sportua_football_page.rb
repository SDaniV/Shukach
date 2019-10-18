require 'require_all'
require_all 'parser'

class SportUAFootballPage < SportUAMainPage
  def go_to_football_page
    @driver.find_element(css: SportUAFootballSelectors::FOOTBALL_TAB).click
  end

  def find_main_post_values
    values = {}
    values[:title] = find_post_title(SportUAFootballSelectors::MAIN_POST_TITLE).gsub("'", '')
    values[:first_paragraph] = find_first_paragraph(SportUAFootballSelectors::MAIN_POST_FIRST_PARAGRAPH).gsub("'", '')
    values[:link] = find_post_link(SportUAFootballSelectors::MAIL_POST_LINK)
    values[:image_path] = find_post_image(SportUAFootballSelectors::MAIN_POST_IMAGE)
    values
  end

  def find_first_popular_post
    values = {}
    values[:title] = find_post_title(SportUAFootballSelectors::FIRST_POPULAR_POST_TITLE)
    values[:first_paragraph] = find_first_paragraph(SportUAFootballSelectors::FIRST_POPULAR_POST_PARAGRAPH)
    values[:link] = find_post_link(SportUAFootballSelectors::FIRST_POPULAR_POST_LINK)
    values[:image_path] = find_post_image(SportUAFootballSelectors::FIRST_POPULAR_POST_IMAGE)
    values
  end

  def find_post_title(selector)
    @driver.find_element(css: selector).text
  end

  def find_first_paragraph(selector)
    @driver.find_element(css: selector).text
  end

  def find_post_link(selector)
    @driver.find_element(css: selector).attribute('href')
  end

  def find_post_image(selector)
    main_img = @driver.find_element(css: selector)
    main_img.attribute('src')
  end
end

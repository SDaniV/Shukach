require 'require_all'
require_all 'data'
require_all 'parser'

class SportUAMainPage < Driver
  def load_main_page
    @driver.navigate.to(SportUALinks::MAIN)
  end

  def go_to_basketball_page
    @driver.find_element(css: SportUABasketballSelectors::BASKETBALL_TAB).click
  end

  def find_main_post_title
    @driver.find_element(css: SportUABasketballSelectors::MAIN_POST_TITLE).text
  end

  def find_first_paragraph
    @driver.find_element(css: SportUABasketballSelectors::MAIN_POST_FIRST_PARAGRAPH).text
  end

  def find_main_post_link
    @driver.find_element(css: SportUABasketballSelectors::MAIL_POST_LINK).attribute('href')
  end

  def find_main_post_image
    main_img = @driver.find_element(css: SportUABasketballSelectors::MAIN_POST_IMAGE)
    main_img.attribute('src')
  end
end

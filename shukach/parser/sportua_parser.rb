require 'selenium-webdriver'

class SportUAParser

  # def initialize(browser)
  #   @browser = browser
  # end

  def load_driver
    root_path = File.dirname(__FILE__)
    Selenium::WebDriver::Chrome::Service.driver_path=File.join("#{root_path}", \
      '../tools/chromedriver/chromedriver76.exe')
    # options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage().window().maximize();
  end

  def vse_na_kupu
    load_driver
    load_sportua
    get_main_news_title
  end

  def get_basketball_news
    load_driver
    load_sportua
    go_to_basketball_page
    get_main_news_title
  end

  def load_sportua
    @driver.navigate.to "https://sport.ua/uk"
  end

  def go_to_basketball_page
    @driver.find_element(css: 'li.nav-list__item:nth-child(5)').click
  end

  def get_main_news_title
    # @driver.find_element(css: 'div.main-post__title.main-post__title_photo').text
    @driver.find_element(css: '.main-post__title').text
  end

  def get_first_paragraph
    @driver.find_element(css: '.main-post > p:nth-child(4)').text
  end

  def get_link_to_full_post
    @driver.find_element(css: '.main-post__title > a:nth-child(1)').attribute('href')
  end

  def get_newest_post_title
    @driver.find_element(css: 'div.main-post__title.main-post__title_dissc').text
  end

  def get_main_image
    main_img = @driver.find_element(css: 'div.main-post > a:nth-child(1) > img:nth-child(1)')
    img_src = main_img.attribute('src')
  end

end
require 'selenium-webdriver'
require 'require_all'
require_all 'parser'
# require_relative 'parser.rb'
# Dir["../*.rb"].each {|file| require file }

class SportAnalyticParser < Driver
  # DELETE IT
  def load_driver
    root_path = File.dirname(__FILE__)
    Selenium::WebDriver::Chrome::Service.driver_path = File.join("#{root_path}.to_s", 
                                                                 ChromeDriverCnst::CHROMEDRIVERPATH)
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.window.maximize
  end

  def get_main_football_post
    load_driver
    load_sportanalytic
    go_to_football_page
    get_main_football_post_title
  end

  def load_sportanalytic
    @driver.navigate.to 'http://sportanalytic.com/'
  end

  def go_to_football_page
    @driver.find_element(css: 'li.base-nav-item:nth-child(3)').click
  end

  def get_main_football_post_title
    css_selector = 'div.bline3:nth-child(3) > div:nth-child(2) > h3:nth-child(3) > a:nth-child(1)'
    @driver.find_element(css: "#{css_selector}").text
  end

  def get_main_post_image
    css_selector = 'div.bline3:nth-child(3) > div:nth-child(2) > img:nth-child(1)'
    main_img = @driver.find_element(css: "#{css_selector}.to_s")
    img_src = main_img.attribute('src')
  end
end

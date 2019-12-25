CHROMEDRIVER_TOOL_PATH = '../tools/chromedriver/chromedriver76.exe'.freeze

class Driver
  def initialize
    # load_driver
    @driver = load_driver
    @driver.manage.window.maximize
    @driver.manage.timeouts.implicit_wait = 15
  end

  def load_driver
    root_path = File.dirname(__FILE__)
    Selenium::WebDriver::Chrome::Service.driver_path = File.join("#{root_path}.to_s",
                                                                 CHROMEDRIVER_TOOL_PATH)
    # options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--disable-gpu')
    # options.add_argument('--start-maximized')
    # options.add_argument('--no-sandbox')
    # options.add_argument('--headless')
    # driver = Selenium::WebDriver.for :chrome, options: options
    Selenium::WebDriver.for :chrome
  end
end

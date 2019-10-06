CHROMEDRIVER_TOOL_PATH = '../tools/chromedriver/chromedriver76.exe'.freeze

class Driver
  def initialize
    @driver = load_driver
    @driver.manage.window.maximize
    @driver.manage.timeouts.implicit_wait = 30
  end

  def load_driver
    root_path = File.dirname(__FILE__)
    Selenium::WebDriver::Chrome::Service.driver_path = File.join("#{root_path}.to_s",
                                                                 CHROMEDRIVER_TOOL_PATH)
    Selenium::WebDriver.for :chrome
  end
end

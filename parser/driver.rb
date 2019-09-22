
CHROMEDRIVER_TOOL_PATH = '../tools/chromedriver/chromedriver76.exe'.freeze

class Driver

  def initialize
    @driver = load_driver
  end
	
  def load_driver
    root_path = File.dirname(__FILE__)
    Selenium::WebDriver::Chrome::Service.driver_path=File.join("#{root_path}", CHROMEDRIVER_TOOL_PATH)
    driver = Selenium::WebDriver.for :chrome
  end


end
require "test_helper"

# Make sure drivers don't fail under parallel testing
WebDrivers::Chromedriver.update

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :headless_chrome
end

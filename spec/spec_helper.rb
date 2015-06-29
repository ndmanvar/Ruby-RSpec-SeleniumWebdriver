require "rspec/expectations"
require "selenium-webdriver"
require "rspec"

RSpec.configure do | config |

  config.before(:each) do
    capabilities_config = {
      :version => "#{ENV['version']}",
      :browserName => "#{ENV['browserName']}",
      :platform => "#{ENV['platform']}"
      # :name => "#{scenario.feature.name} - #{scenario.name}"
    }

    url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub".strip
    @browser = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities_config)
  end

  config.after(:each) do
    @browser.quit
  end

end

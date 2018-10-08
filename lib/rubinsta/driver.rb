require 'selenium-webdriver'

module Rubinsta
	class Driver
		attr_reader :selenium, :url

	  def initialize(url: nil, driver: nil)
			@url = url || 'https://instagram.com'
	    @selenium = Selenium::WebDriver.for(driver || :firefox)
		end

		def wait_until(word)
			wait = Selenium::WebDriver::Wait.new(timeout: 25)
			wait.until { /#{word}/.match(selenium.page_source) }
		end

		def close_browser()
	    selenium.quit
	  end
	end
end

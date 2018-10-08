module Rubinsta
	class InitPage < Component
		def execute
			super
			driver.selenium.manage.window.maximize
			driver.selenium.navigate.to(driver.url)

			driver.wait_until("Log in")
		end
	end
end

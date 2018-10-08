module Rubinsta
	class CloseNotification < Component
		def execute
			super
			close_notification_popup
		end

		private

		def close_notification_popup
			driver.wait_until('Turn on Notifications')
			driver.selenium.find_element(:xpath, "//button[text() = 'Not Now']").click
		end
	end
end

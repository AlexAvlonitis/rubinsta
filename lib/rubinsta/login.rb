module Rubinsta
  class Login < Component
    def initialize(driver, username, password)
      super(driver)
      @username = username
      @password = password
    end

    def execute
      super
      go_to_login_page
      login
    end

    private

    attr_reader :username, :password

    def go_to_login_page
      driver.selenium.find_element(:link, 'Log in').click
    end

    def login
      driver.wait_until('Phone number')

      driver.selenium.find_element(:name, 'username').send_keys(username)
      driver.selenium.find_element(:name, 'password').send_keys(password)
      driver.selenium.find_element(:xpath, "//button[text() = 'Log in']").click
    end
  end
end

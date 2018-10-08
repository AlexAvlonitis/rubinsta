require_relative './rubinsta/driver'
require_relative './rubinsta/component'
require_relative './rubinsta/init_page'
require_relative './rubinsta/login'
require_relative './rubinsta/close_notification'
require_relative './rubinsta/composite'
require_relative './rubinsta/search_tag'
require_relative './rubinsta/like_post'
require 'yaml'

class RubinstaFactory
  def self.build
    config = YAML.load_file('./lib/config.yml')

    driver = Rubinsta::Driver.new(
      url: nil,
      driver: config.dig('options', 'driver').to_sym
    )
    init_page = Rubinsta::InitPage.new(driver)
    login = Rubinsta::Login.new(
      driver,
      config.dig('options', 'username'),
      config.dig('options', 'password')
    )
    close_notification = Rubinsta::CloseNotification.new(driver)
    search_tag = Rubinsta::SearchTag.new(driver, config.dig('options', 'tags'))
    like_post = Rubinsta::LikePost.new(driver)

    rubinsta_composite =
      Rubinsta::Composite.new(
        init_actions: [
          init_page,
          login,
          close_notification
        ],
        actions: [search_tag, like_post],
        times_to_run: config.dig('options', 'times_to_run')
      )

    rubinsta_composite.execute
    driver.close_browser
  end
end

RubinstaFactory.build

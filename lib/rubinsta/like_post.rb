module Rubinsta
  class LikePost < Component
    def execute
      super
      find_and_click_last_post
      find_and_click_like_button
    end

    private

    def find_and_click_last_post
      post = driver.selenium.find_elements(class: 'v1Nh3')[9]
      post.click
      post.click
    end

    def find_and_click_like_button
      driver.wait_until('Add a comment...')
      return if clicked?

      driver
        .selenium
        .find_element(:class, 'coreSpriteHeartOpen')
        .click
    end

    def clicked?
      driver.selenium.find_elements(:class, 'glyphsSpriteHeart__filled__24__red_5').size > 0
    end
	end
end

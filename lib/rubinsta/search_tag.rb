module Rubinsta
  class SearchTag < Component
    def initialize(driver, tags = [])
      super(driver)
      @tags = tags
      @current_tag_index = 0
    end

    def execute
      super
      search_for_tags
      @current_tag_index += 1
    end

    private

    attr_reader :tags, :current_tag_index

    def search_for_tags
     tag = get_tag_by_index

      driver.selenium.navigate.to(driver.url + '/explore/tags/' + tag)
      driver.wait_until("##{tag}")
    end

    def get_tag_by_index
      if current_tag_index == tags.size
        @current_tag_index = 0
      end
      tags[current_tag_index]
    end
  end
end

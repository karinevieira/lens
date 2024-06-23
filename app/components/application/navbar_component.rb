# frozen_string_literal: true

module Application
  class NavbarComponent < ViewComponent::Base
    def initialize(current_user:, current_controller: nil)
      @current_user = current_user
      @current_controller = current_controller
    end

    private

    attr_reader :current_user, :current_controller

    def activate_home_item?
      current_page?(controller: "posts", action: "index")
    end

    def activate_search_item?
      current_page?(controller: "profiles", action: "index")
    end

    def activate_new_post_item?
      current_page?(controller: "posts", action: "new")
    end

    def activate_profile_item?
      current_controller.is_a?(UsersController) || current_controller.is_a?(ProfilesController)
    end
  end
end

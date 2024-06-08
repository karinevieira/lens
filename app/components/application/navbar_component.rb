# frozen_string_literal: true

module Application
  class NavbarComponent < ViewComponent::Base
    def initialize(current_user:, current_controller:)
      @current_user = current_user
      @current_controller = current_controller
    end

    private

    attr_reader :current_user, :current_controller

    def activate_home_item?
      current_controller.is_a?(PostsController) && current_action_is_a?(:index)
    end

    def activate_new_post_item?
      current_controller.is_a?(PostsController) && current_action_is_a?(:new)
    end

    def activate_profile_item?
      current_controller.is_a?(UsersController) || current_controller.is_a?(ProfilesController)
    end

    def current_action_is_a?(action)
      current_controller.action_name == action.to_s
    end
  end
end

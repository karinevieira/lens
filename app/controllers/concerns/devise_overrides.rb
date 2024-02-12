# frozen_string_literal: true

module DeviseOverrides
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:email, :password, { profile_attributes: %i[display_name username] }]
    )
  end
end

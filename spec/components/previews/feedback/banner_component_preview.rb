# frozen_string_literal: true

module Feedback
  class BannerComponentPreview < ViewComponent::Preview
    # @!group Types
    # @label Alert
    def with_alert_type
      render(Feedback::BannerComponent.new(type: :alert)) { "Houve um erro ao criar publicação" }
    end

    # @label Notice
    def with_notice_type
      render(Feedback::BannerComponent.new(type: :notice)) { "Publicação criada com sucesso!" }
    end
    # @!endgroup
  end
end

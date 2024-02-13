# frozen_string_literal: true

module Users
  class AvatarComponentPreview < ViewComponent::Preview
    def default
      render(Users::AvatarComponent.new(image_url: "https://i.pravatar.cc/150?img=3"))
    end
  end
end

# frozen_string_literal: true

module Structure
  class NavbarComponent < ViewComponent::Base
    renders_many :items, Structure::Navbar::ItemComponent
  end
end

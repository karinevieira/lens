# frozen_string_literal: true

module Users
  class ProfileStatsComponent < ViewComponent::Base
    attr_reader :stats

    def initialize(stats:)
      @stats = stats
    end
  end
end

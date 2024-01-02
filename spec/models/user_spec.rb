# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  it { is_expected.to have_many(:likes) }
end

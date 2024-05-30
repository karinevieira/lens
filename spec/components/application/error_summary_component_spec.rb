# frozen_string_literal: true

require "rails_helper"

RSpec.describe Application::ErrorSummaryComponent, type: :component do
  it "renders record errors" do
    invalid_post = Post.new
    invalid_post.valid?

    rendered = render_inline(described_class.new(record: invalid_post))

    expect(rendered).to have_text("Usuário é obrigatório")
      .and(have_text("Imagem não pode ficar em branco"))
  end
end

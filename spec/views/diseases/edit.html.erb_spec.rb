require 'rails_helper'

RSpec.describe 'diseases/edit', type: :view do
  let(:disease) { create(:disease) }
  let!(:item) do
    assign(:disease, disease.decorate)
    render
  end

  it 'page have a title "Изменить болезнь"' do
    expect(rendered).to have_selector('h3', text: 'Изменить болезнь')
  end
end

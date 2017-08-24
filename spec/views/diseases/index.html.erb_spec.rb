require 'rails_helper'

RSpec.describe 'diseases/index', type: :view do
  let(:disease_1) { create(:disease) }
  let(:disease_2) { create(:disease) }
  let(:admin) { create(:admin) }
  before { sign_in admin }

  it 'page have diseases title' do
    assign(:diseases, [disease_1, disease_2])
    render
    expect(rendered).to have_selector('a', text: disease_1.title).and have_selector('a', text: disease_2.title)
  end
end

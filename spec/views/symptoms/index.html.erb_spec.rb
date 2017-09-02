require 'rails_helper'

RSpec.describe 'symptoms/index', type: :view do
  let(:symptom_1) { create(:symptom) }
  let(:symptom_2) { create(:symptom) }
  let(:admin) { create(:admin) }
  before { sign_in admin }

  it 'page have symptoms title' do
    assign(:symptoms, [symptom_1, symptom_2])
    render
    expect(rendered).to have_selector('a', text: symptom_1.title).and have_selector('a', text: symptom_2.title)
  end
end

require 'rails_helper'

RSpec.describe "symptoms/show", type: :view do
  let(:symptom) { create(:symptom) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:symptom, symptom)
    render
  end
  
  it 'page have symptoms title' do
    expect(rendered).to have_selector('h3', text: symptom.title)
  end

  it 'page have symptoms description' do
    expect(rendered).to have_selector('p', text: symptom.description)
  end
end

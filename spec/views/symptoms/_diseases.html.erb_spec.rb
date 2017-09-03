require 'rails_helper'

RSpec.describe "symptoms/_diseases", type: :view do
  let(:symptom) { create(:symptom, diseases: [create(:disease)]) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:symptom, symptom)
    render
  end

  it 'page have symptoms disease' do
    expect(rendered).to have_selector('div.list-group-item', text: symptom.diseases.first.title)
  end
end

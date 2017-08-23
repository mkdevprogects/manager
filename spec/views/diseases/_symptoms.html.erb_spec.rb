require 'rails_helper'

RSpec.describe 'diseases/_symptoms', type: :view do
  let(:disease) { create(
      :disease,
      symptoms: [create(:symptom)]
  )}
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:disease, disease)
    render
  end

  it 'page have diseases symptom' do
    expect(rendered).to have_selector('div.list-group-item', text: disease.symptoms.first.title)
  end
end
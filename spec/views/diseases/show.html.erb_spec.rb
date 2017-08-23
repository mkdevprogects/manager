require 'rails_helper'

RSpec.describe "diseases/show", type: :view do
  let(:disease) { create(
      :disease,
      specializations: [create(:specialization)],
      symptoms: [create(:symptom)]
  )}
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:disease, disease)
    render
  end

  it 'page have diseases title' do
    expect(response.body).to have_selector('h3', text: disease.title)
  end

  it 'page have diseases description' do
    expect(response.body).to have_selector('p', text: disease.description)
  end

  it 'page have diseases icd_code' do
    expect(response.body).to have_selector('p', text: disease.icd_code)
  end
end

require 'rails_helper'

RSpec.describe 'clinics/show', type: :view do
  let(:specialization) { create(:specialization) }
  let(:doctor) { create(:doctor, specializations: [specialization]) }
  let(:clinic) { create(:clinic, doctors: [doctor]) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:clinic, clinic)
    render
  end

  it 'page have clinics title' do
    expect(rendered).to have_selector('h3', text: clinic.title)
  end
end

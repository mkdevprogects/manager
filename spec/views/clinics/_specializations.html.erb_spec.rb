require 'rails_helper'

RSpec.describe "clinics/_specializations", type: :view do
  let(:specialization) { create(:specialization) }
  let(:doctor) { create(:doctor, specializations: [specialization]) }
  let(:clinic) { create(:clinic, doctors: [doctor]) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:clinic, clinic)
    render
  end

  it 'page have clinics specializations' do
    expect(rendered).to have_selector('div.list-group-item', text: clinic.specializations_titles.first)
  end
end

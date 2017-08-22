require 'rails_helper'

RSpec.describe "clinics/_doctors", type: :view do
  let(:doctor) { create(:doctor) }
  let(:clinic) { create(:clinic, doctors: [doctor]) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:clinic, clinic)
    render
  end

  it 'page have clinics doctor' do
    expect(rendered).to have_selector('div.list-group-item', text: doctor.surname_name)
  end
end

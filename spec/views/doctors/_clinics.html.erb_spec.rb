require 'rails_helper'

RSpec.describe "doctors/_clinics", type: :view do
  let(:doctor) { create(:doctor, clinics: [create(:clinic)]) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:doctor, doctor)
    render
  end

  it 'page have doctors clinic' do
    expect(rendered).to have_selector('div.list-group-item', text: doctor.clinics.first.title)
  end
end

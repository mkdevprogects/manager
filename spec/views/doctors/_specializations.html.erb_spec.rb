require 'rails_helper'

RSpec.describe "doctors/_specializations", type: :view do
  let(:specialization) { create(:specialization) }
  let(:doctor) { create(:doctor, specializations: [specialization]) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:doctor, doctor)
    render
  end

  it 'page have doctors specializations' do
    expect(rendered).to have_selector('div.list-group-item', text: doctor.specializations.first.title)
  end
end

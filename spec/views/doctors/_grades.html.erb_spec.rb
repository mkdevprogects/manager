require 'rails_helper'

RSpec.describe "doctors/_grades", type: :view do
  let(:doctor) { create(:doctor, grades: [create(:grade)]) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:doctor, doctor)
    render
  end

  it 'page have doctors grade' do
    expect(rendered).to have_selector('div.list-group-item', text: doctor.grades.first.title)
  end
end

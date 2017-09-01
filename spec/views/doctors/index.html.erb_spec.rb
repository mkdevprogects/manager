require 'rails_helper'

RSpec.describe "doctors/index", type: :view do
  let(:doctor) { create(:doctor)}
  let(:doctor_2) { create(:doctor) }
  let(:admin) { create(:admin) }

  before { sign_in admin }

  it 'page have doctors full name' do
    assign(:doctors, [doctor, doctor_2])
    render
    expect(rendered).to have_selector('a', text: doctor.full_name).and have_selector('a', text: doctor_2.full_name)
  end
end

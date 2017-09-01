require 'rails_helper'

RSpec.describe "doctors/show", type: :view do
  let(:doctor) { create(:doctor)}
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:doctor, doctor)
    render
  end

  it 'page have doctors full name' do
    expect(rendered).to have_selector('h3', text: doctor.full_name)
  end

  it 'page have doctors phone' do
    expect(rendered).to have_selector('p', text: doctor.phone)
  end

  it 'page have doctors email' do
    expect(rendered).to have_selector('p', text: doctor.email)
  end
end

require 'rails_helper'

RSpec.describe 'clinics/new', type: :view do
  let!(:doctors) { [create(:doctor), create(:doctor)] }
  let(:clinic) { create(:clinic) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:clinic, clinic.decorate)
    render
  end

  it 'page have a doctors' do
    expect(rendered).to match(doctors.first.surname_name).and match(doctors.last.surname_name)
  end

  it 'page have a label "Название клиники"' do
    expect(rendered).to match 'Название клиники'
  end
  it 'page have a label "Телефон клиники"' do
    expect(rendered).to match 'Телефон клиники'
  end
  it 'page have a label "Email клиники"' do
    expect(rendered).to match 'Email клиники'
  end
  it 'page have a label "Адрес клиники"' do
    expect(rendered).to match 'Адрес клиники'
  end
end

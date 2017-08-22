require 'rails_helper'

RSpec.describe "clinics/_form", type: :view do
  let!(:doctors) { [create(:doctor), create(:doctor)] }
  let(:clinic) { create(:clinic) }
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:clinic, clinic.decorate)
    render
  end



  it 'page have a label "Название клиники"' do
    expect(rendered).to have_selector('label', text: 'Название клиники')
  end
  it 'page have a label "Телефон клиники"' do
    expect(rendered).to have_selector('label', text: 'Телефон клиники')
  end
  it 'page have a label "Email клиники"' do
    expect(rendered).to have_selector('label', text: 'Email клиники')
  end
  it 'page have a label "Адрес клиники"' do
    expect(rendered).to have_selector('label', text: 'Адрес клиники')
  end

  context 'new clinic' do
    it 'page have unchecked checkoxes doctors' do
      # изменить тест, использовать чекбоксы и матчеры капибары
      expect(rendered).to match(doctors.first.surname_name).and match(doctors.last.surname_name)
    end

  end

  context 'edit clinic' do
    it 'page have checked doctors checkoboxes' do
      # изменить тест, использовать чекбоксы и матчеры капибары
      # expect(rendered).to match(doctors.first.surname_name).and match(doctors.last.surname_name)
      expect(rendered).to have_checked_field("input#clinic_doctor_ids_#{doctors.first.id}")
    end
    it 'page have clinics title' do
      expect(rendered).to have_selector("input#clinic_title[value='#{clinic.title}']")
    end

    it 'page have clinics phone' do
      expect(rendered).to have_selector("input#clinic_phone[value='#{clinic.phone}']")
    end

    it 'page have clinics email' do
      expect(rendered).to have_selector("input#clinic_email[value='#{clinic.email}']")
    end

    it 'page have clinics address' do
      expect(rendered).to have_selector("input#clinic_address[value='#{clinic.address}']")
    end
  end
end

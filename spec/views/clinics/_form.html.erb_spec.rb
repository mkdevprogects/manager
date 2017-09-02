require 'rails_helper'

RSpec.describe "clinics/_form", type: :view do
  let!(:doctor) { create(:doctor) }
  let(:admin) { create(:admin) }
  before { sign_in admin }

  context 'page have a labels:' do
    let(:clinic) { create(:clinic) }
    let!(:item) do
      assign(:clinic, clinic.decorate)
      render
    end

    it I18n.t('activerecord.attributes.clinic.title') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.clinic.title'))
    end
    it I18n.t('activerecord.attributes.clinic.phone') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.clinic.phone'))
    end
    it I18n.t('activerecord.attributes.clinic.email') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.clinic.email'))
    end
    it I18n.t('activerecord.attributes.clinic.address') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.clinic.address'))
    end
  end

  context 'new clinic' do
    let(:clinic) { build(:clinic) }
    let!(:item) do
      assign(:clinic, clinic.decorate)
      render
    end

    it 'page have unchecked checkoxes doctors' do
      expect(rendered).to have_selector("input#clinic_doctor_ids_#{doctor.id}[type='checkbox']")
    end

  end

  context 'edit clinic' do
    let(:clinic) { create(:clinic) }
    let!(:item) do
      clinic.doctors = [doctor]
      assign(:clinic, clinic.decorate)
      render
    end

    it 'page have checked doctors checkoboxes' do
      expect(rendered).to have_selector("input#clinic_doctor_ids_#{doctor.id}[checked='checked']")
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

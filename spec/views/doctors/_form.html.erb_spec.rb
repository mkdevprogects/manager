require 'rails_helper'

RSpec.describe "doctors/_form", type: :view do
  let!(:grade) { create(:grade) }
  let!(:specialization) { create(:specialization) }
  let!(:clinic) { create(:clinic) }
  let(:admin) { create(:admin) }
  before { sign_in admin }

  context 'page have a labels:' do
    let(:doctor) { create(:doctor) }
    let!(:item) do
      assign(:doctor, doctor.decorate)
      render
    end

    it I18n.t('activerecord.attributes.doctor.name') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.doctor.name'))
    end

    it I18n.t('activerecord.attributes.doctor.surname') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.doctor.surname'))
    end

    it I18n.t('activerecord.attributes.doctor.patronymic') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.doctor.patronymic'))
    end

    it I18n.t('activerecord.attributes.doctor.phone') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.doctor.phone'))
    end

    it I18n.t('activerecord.attributes.doctor.email') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.doctor.email'))
    end
  end

  context 'new doctor' do
    let(:doctor) { build(:doctor) }
    let!(:item) do
      assign(:doctor, doctor.decorate)
      render
    end

    it 'page have unchecked checkoxes grades' do
      expect(rendered).to have_selector("input#doctor_grade_ids_#{grade.id}[type='checkbox']")
    end

    it 'page have unchecked checkoxes specializations' do
      expect(rendered).to have_selector("input#doctor_specialization_ids_#{specialization.id}[type='checkbox']")
    end

    it 'page have unchecked checkoxes clinics' do
      expect(rendered).to have_selector("input#doctor_clinic_ids_#{clinic.id}[type='checkbox']")
    end
  end

  context 'edit doctor' do
    let(:doctor) { create(:doctor) }
    let!(:item) do
      doctor.grades = [grade]
      doctor.specializations = [specialization]
      doctor.clinics = [clinic]
      assign(:doctor, doctor.decorate)
      render
    end

    it 'page have checked checkboxes grades' do
      expect(rendered).to have_selector("input#doctor_grade_ids_#{grade.id}[checked='checked']")
    end

    it 'page have checked checkboxes specializations' do
      expect(rendered).to have_selector("input#doctor_specialization_ids_#{specialization.id}[checked='checked']")
    end

    it 'page have checked checkboxes clinics' do
      expect(rendered).to have_selector("input#doctor_clinic_ids_#{clinic.id}[checked='checked']")
    end

    it 'page have doctors name' do
      expect(response.body).to have_selector("input#doctor_name[value='#{doctor.name}']")
    end

    it 'page have doctors surname' do
      expect(response.body).to have_selector("input#doctor_surname[value='#{doctor.surname}']")
    end

    it 'page have doctors patronymic' do
      expect(response.body).to have_selector("input#doctor_patronymic[value='#{doctor.patronymic}']")
    end

    it 'page have doctors phone' do
      expect(response.body).to have_selector("input#doctor_phone[value='#{doctor.phone}']")
    end

    it 'page have doctors email' do
      expect(response.body).to have_selector("input#doctor_email[value='#{doctor.email}']")
    end
  end
end

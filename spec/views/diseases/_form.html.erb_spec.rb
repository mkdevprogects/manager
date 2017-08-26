require 'rails_helper'

RSpec.describe "diseases/_form", type: :view do
  let!(:specialization) { create(:specialization) }
  let!(:symptom) { create(:symptom) }
  let(:admin) { create(:admin) }
  before { sign_in admin }

  context 'page have a labes' do
    let(:disease) { create(:disease) }
    let!(:item) do
      assign(:disease, disease.decorate)
      render
    end

    it 'page have a label "Название болезни"' do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.disease.title'))
    end

    it 'page have a label "Код по МКБ"' do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.disease.icd_code'))
    end

    it 'page have a label "Описание болезни"' do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.disease.description'))
    end
  end

  context 'new disease' do
    let(:disease) { build(:disease) }
    let!(:item) do
      assign(:disease, disease.decorate)
      render
    end

    it 'page have unchecked specializations checkoboxes' do
      expect(rendered).to have_selector("input#disease_specialization_ids_#{specialization.id}[type='checkbox']")
    end

    it 'page have unchecked symptoms checkoboxes' do
      expect(rendered).to have_selector("input#disease_symptom_ids_#{symptom.id}[type='checkbox']")
    end
  end

  context 'edit disease' do
    let(:disease) { create(:disease) }
    let!(:item) do
      disease.specializations = [specialization]
      disease.symptoms = [symptom]
      assign(:disease, disease.decorate)
      render
    end

    it 'page have checked specializations checkoboxes' do
      expect(rendered).to have_selector("input#disease_specialization_ids_#{specialization.id}[checked='checked']")
    end

    it 'page have checked symptoms checkoboxes' do
      expect(rendered).to have_selector("input#disease_symptom_ids_#{symptom.id}[checked='checked']")
    end

    it 'page have diseases title' do
      expect(rendered).to have_selector("input#disease_title[value='#{disease.title}']")
    end

    it 'page have diseases icd_code' do
      expect(rendered).to have_selector("input#disease_icd_code[value='#{disease.icd_code}']")
    end

    it 'page have diseases description' do
      expect(rendered).to have_selector("textarea#disease_description", text: disease.description)
    end
  end
end

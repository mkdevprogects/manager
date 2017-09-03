require 'rails_helper'

RSpec.describe "symptoms/_form", type: :view do
  let!(:disease) { create(:disease) }
  let(:admin) { create(:admin) }
  before { sign_in admin }

  context 'page have a labels:' do
    let(:symptom) { create(:symptom) }
    let!(:item) do
      assign(:symptom, symptom.decorate)
      render
    end

    it I18n.t('activerecord.attributes.symptom.title') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.symptom.title'))
    end
    
    it I18n.t('activerecord.attributes.symptom.description') do
      expect(rendered).to have_selector('label', text: t('activerecord.attributes.symptom.description'))
    end
  end

  context 'new symptom' do
    let(:symptom) { build(:symptom) }
    let!(:item) do
      assign(:symptom, symptom.decorate)
      render
    end

    it 'page have unchecked checkoxes diseases' do
      expect(rendered).to have_selector("input#symptom_disease_ids_#{disease.id}[type='checkbox']")
    end
  end

  context 'edit symptom' do
    let(:symptom) { create(:symptom) }
    let!(:item) do
      symptom.diseases = [disease]
      assign(:symptom, symptom.decorate)
      render
    end

    it 'page have checked diseases checkoboxes' do
      expect(rendered).to have_selector("input#symptom_disease_ids_#{disease.id}[checked='checked']")
    end

    it 'page have symptoms title' do
      expect(rendered).to have_selector("input#symptom_title[value='#{symptom.title}']")
    end

    it 'page have symptoms description' do
      expect(rendered).to have_selector('textarea#symptom_description', text: symptom.description)
    end
  end
end

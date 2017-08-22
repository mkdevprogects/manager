require 'spec_helper'

describe SymptomDecorator do
  context 'create' do
    subject { described_class.new(obj) }
    let(:obj) { build(:symptom) }

    it 'создание объекта' do
      expect(subject.pages_title).to be == 'Создать'
    end
  end

  context 'edit' do
    subject { described_class.new(obj) }
    let(:obj) { create(:symptom) }
    it 'изменение объекта' do
      obj.save!
      expect(subject.pages_title).to be == 'Изменить'
    end
  end
end

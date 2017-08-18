require 'spec_helper'

describe SymptomDecorator do
  subject { described_class.new(obj) }
  let(:obj) { create(:symptom) }

  it 'создание объекта' do
    expect(obj.pages_title).to be == 'Создать'
  end

  it 'изменение объекта' do
    obj.save!
    expect(obj.pages_title).to be == 'Изменить'
  end
end

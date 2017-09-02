require 'spec_helper'

describe History::PerformedActionDecorator do
  context 'create' do
    subject { described_class.new(obj) }
    let(:obj) { create(:symptom) }

  end

  context 'update' do
    subject { described_class.new(obj) }
    let(:obj) { create(:symptom) }
    before do
      subject.update!(title: 'something')
    end
    expect(subject.action).to be == I18n.t('actions.create')
  end

  context 'destroy' do
    subject { described_class.new(obj) }
    let(:obj) { create(:symptom) }
  end
end

require 'rails_helper'

describe History::PerformedActionDecorator do
  subject { described_class.new(obj) }
  let(:obj) { create(:performed_action) }

  context 'create' do
  end

  context 'update' do
    before do
      subject.update!(action: 'update')
    end

    it { expect(subject.action).to be == I18n.t('actions.update') }
  end

  context 'destroy' do
  end
end

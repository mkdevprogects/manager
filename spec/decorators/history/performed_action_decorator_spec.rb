require 'rails_helper'

describe History::PerformedActionDecorator do
  context 'create' do
    subject { described_class.new(create(:performed_action, action: 'create')) }

    it { expect(subject.action).to be == I18n.t('actions.create') }
  end

  context 'update' do
    subject { described_class.new(create(:performed_action, action: 'update')) }

    it { expect(subject.action).to be == I18n.t('actions.update') }
  end

  context 'destroy' do
    subject { described_class.new(create(:performed_action, action: 'destroy')) }

    it { expect(subject.action).to be == I18n.t('actions.delete') }
  end
end

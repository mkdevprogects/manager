require 'rails_helper'

RSpec.describe 'clinics/edit', type: :view do
  let(:clinic) { create(:clinic) }
  let!(:item) do
    assign(:clinic, clinic.decorate)
    render
  end

  it "page have a title '#{I18n.t('actions.edit')} #{I18n.t('clinics.form.clinic')}'" do
    expect(rendered).to have_selector('h3', text: "#{t('actions.edit')} #{t('clinics.form.clinic')}")
  end
end

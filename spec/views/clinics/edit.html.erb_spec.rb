require 'rails_helper'

RSpec.describe 'clinics/edit', type: :view do
  let(:clinic) { create(:clinic) }
  let!(:item) do
    assign(:clinic, clinic.decorate)
    render
  end

  it 'page have a title "Изменить клинику"' do
    expect(rendered).to have_selector('h3', text: "#{t('clinics.actions.edit')} #{t('clinics.form.clinic')}")
  end
end

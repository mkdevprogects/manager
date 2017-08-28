require 'rails_helper'

RSpec.describe 'diseases/new', type: :view do
  let(:disease) { build(:disease) }
  let!(:item) do
    assign(:disease, disease.decorate)
    render
  end

  it 'page have a title "Создать болезнь"' do
    expect(rendered).to have_selector('h3', text: "#{t('actions.create')} #{t('diseases.form.disease')}")
  end
end

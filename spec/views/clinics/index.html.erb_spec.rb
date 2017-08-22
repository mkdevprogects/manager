require 'rails_helper'

RSpec.describe 'clinics/index', type: :view do
  let(:clinic) { create(:clinic) }
  let(:clinic_2) { create(:clinic) }
  let(:admin) { create(:admin) }
  before { sign_in admin }

  it 'page have clinics title' do
    assign(:clinics, [clinic, clinic_2])
    render
    expect(rendered).to have_selector('a', text: clinic.title).and have_selector('a', text: clinic_2.title)
  end
end

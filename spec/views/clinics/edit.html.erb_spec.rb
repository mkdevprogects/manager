require 'rails_helper'

RSpec.describe 'clinics/edit', type: :view do
  let(:clinic) { create(:clinic) }
  let!(:item) do
    assign(:clinic, clinic.decorate)
    render
  end
  it 'page have clinics title' do
    expect(rendered).to match clinic.title
  end

  it 'page have clinics phone' do
    expect(rendered).to match clinic.phone
  end

  it 'page have clinics email' do
    expect(rendered).to match clinic.email
  end

  it 'page have clinics address' do
    expect(rendered).to match clinic.address
  end
end

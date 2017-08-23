require 'rails_helper'

RSpec.describe "diseases/_specializations", type: :view do
  let(:disease) { create(
      :disease,
      specializations: [create(:specialization)]
  )}
  let(:admin) { create(:admin) }
  before { sign_in admin }
  let!(:item) do
    assign(:disease, disease)
    render
  end

  it 'page have diseases specializations' do
    expect(rendered).to have_selector('div.list-group-item', text: disease.specializations.first.title)
  end
end
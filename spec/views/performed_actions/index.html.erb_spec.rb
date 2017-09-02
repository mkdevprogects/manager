require 'rails_helper'

RSpec.describe "performed_actions/index.html.erb", type: :view do
  let(:performed_action) { create(:performed_action) }
  let(:admin) { create(:admin) }
  let(:doctor) { create(:doctor)}
  before do
    performed_action.actor = admin
    performed_action.subject = doctor
  end
  before { sign_in admin }
  let!(:item) do
    assign(:performed_actions, [performed_action])
    render
  end

  it 'page have performed_actions actor_id' do
    expect(rendered).to have_selector('td', text: performed_action.actor_id)
  end

  it 'page have performed_actions actor_type' do
    expect(rendered).to have_selector('td', text: performed_action.actor_type)
  end

  it 'page have performed_actions action' do
    expect(rendered).to have_selector('td', text: performed_action.action)
  end

  it 'page have performed_actions subject_type' do
    expect(rendered).to have_selector('td', text: performed_action.subject_type)
  end

  it 'page have performed_actions created_at' do
    expect(rendered).to have_selector('td', text: performed_action.created_at)
  end

  it 'page have performed_actions actors name' do
    expect(rendered).to have_selector('td', text: performed_action.actor.name)
  end
end

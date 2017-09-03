require 'rails_helper'

RSpec.describe PerformedActionsController, type: :controller do

  context 'signed in' do
    let(:admin) { create(:admin) }

    before { sign_in admin }

    describe 'GET #index' do
      let!(:performed_action_1) { create(:performed_action) }
      let!(:performed_action_2) { create(:performed_action) }

      before { get :index }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'loads all performed actions' do
        expect(assigns(:performed_actions)).to match_array([performed_action_1, performed_action_2])
      end
    end
  end

  context 'guest' do
    describe 'GET #index' do
      it 'redirect to admin/sign_in' do
        get :index
        expect(response).to admin_sign_in
      end
    end
  end
end

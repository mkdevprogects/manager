require 'rails_helper'

RSpec.describe SymptomsController, type: :controller do
  render_views

  let(:symptom) { create(:symptom) }

  context 'signed in' do
    let(:admin) { create(:admin) }

    before { sign_in admin }
    describe 'GET #index' do
      let!(:symptom_1) { create(:symptom) }
      let!(:symptom_2) { create(:symptom) }

      before { get :index }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'loads all symptoms' do
        expect(assigns(:symptoms)).to match_array([symptom_1, symptom_2])
      end
    end

    describe 'GET #show' do
      let(:symptom) { create(:symptom, diseases: [create(:disease)]) }

      before { get :show, { id: symptom.id} }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end

      it 'load symptom' do
        expect(assigns(:symptom)).to eq(symptom)
      end
    end

    describe 'GET #new' do
      before { get :new }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end
    end

    describe 'GET #edit' do
      before { get :edit, { id: symptom.id} }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end

    describe 'POST #create' do
      context 'valid data' do
        it 'redirect to show' do
          post :create, { symptom: attributes_for(:symptom)}
          expect(response).to redirect_to assigns(:symptom)
        end
      end

      context 'not valid data' do
        it 'renders the new template' do
          post :create, { symptom: { title: nil }}
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'POST #update' do
      context 'valid data' do
        it 'redirect to show' do
          patch :update, { id: symptom.id, symptom: attributes_for(:symptom) }
          expect(response).to redirect_to assigns(:symptom)
        end
      end

      context 'not valid data' do
        it 'renders the edit template' do
          patch :update, { id: symptom.id, symptom: { title: nil }}
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'POST #destroy' do
      it 'redirect to index' do
        delete :destroy, { id: symptom.id}
        expect(response).to redirect_to action: :index
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

    describe 'GET #show' do
      it 'redirect to admin/sign_in' do
        get :show, { id: symptom.id}
        expect(response).to admin_sign_in
      end
    end

    describe 'GET #new' do
      it 'redirect to admin/sign_in' do
        get :new
        expect(response).to admin_sign_in
      end
    end

    describe 'GET #edit' do
      it 'redirect to admin/sign_in' do
        get :edit, { id: symptom.id}
        expect(response).to admin_sign_in
      end
    end
  end
end

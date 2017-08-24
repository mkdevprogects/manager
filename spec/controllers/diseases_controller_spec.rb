require 'rails_helper'

RSpec.describe DiseasesController, type: :controller do
  render_views

  let(:disease) {create(:disease)}

  context 'signed in' do
    let(:admin) { create(:admin) }

    before { sign_in admin }

    describe 'GET #index' do
      let!(:disease_1) { create(:disease) }
      let!(:disease_2) { create(:disease) }

      before { get :index }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template('index')
      end

      it 'loads all diseases' do
        expect(assigns(:diseases)).to match_array([disease_1, disease_2])
      end
    end

    describe 'GET #show' do
      let(:disease) { create(
                          :disease,
                          specializations: [create(:specialization)],
                          symptoms: [create(:symptom)]
      )}

      before { get :show, { id: disease.id} }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        expect(response).to render_template('show')
      end

      it 'load disease' do
        expect(assigns(:disease)).to eq(disease)
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
      before { get :edit, { id: disease.id} }

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
          post :create, { disease: attributes_for(:disease) }
          expect(response).to redirect_to assigns(:disease)
        end
      end

      context 'not valid data' do
        it 'renders the new template' do
          post :create, { disease: {title: nil }}
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'POST #update' do
      context 'valid data' do
        it 'redirect to show' do
          patch :update, { id: disease.id, disease: attributes_for(:disease) }
          expect(response).to redirect_to assigns(:disease)
        end
      end

      context 'not valid data' do
        it 'renders the edit template' do
          patch :update, { id: disease.id, disease: {title: nil }}
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'POST #destroy' do
      it 'redirect to index' do
        delete :destroy, { id: disease.id}
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
        get :show, { id: disease.id}
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
        get :edit, { id: disease.id}
        expect(response).to admin_sign_in
      end
    end
  end
end

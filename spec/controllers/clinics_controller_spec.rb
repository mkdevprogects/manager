require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  render_views
  let(:clinic) { create(:clinic) }

  context 'signed in' do
    let(:admin) { create(:admin) }

    before { sign_in admin }

    describe 'GET #index' do
      let!(:clinic_1) { create(:clinic) }
      let!(:clinic_2) { create(:clinic) }

      before { get :index }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'loads all clinics' do
        expect(assigns(:clinics)).to match_array([clinic_1, clinic_2])
      end
    end

    describe 'GET #show' do
      let(:specialization) { create(:specialization) }
      let(:doctor) { create(:doctor, specializations: [specialization]) }
      let(:clinic) { create(:clinic, doctors: [doctor]) }

      before { get :show, { id: clinic.id} }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end

      it 'load clinic' do
        expect(assigns(:clinic)).to eq(clinic)
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
      before { get :edit, { id: clinic.id} }

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
          post :create, { clinic: attributes_for(:clinic) }
          expect(response).to redirect_to assigns(:clinic)
        end
      end

      context 'not valid data' do
        it 'renders the new template' do
          post :create, { clinic: {title: clinic.title }}
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'POST #update' do
      context 'valid data' do
        it 'redirect to show' do
          patch :update, { id: clinic.id, clinic: attributes_for(:clinic) }
          expect(response).to redirect_to assigns(:clinic)
        end
      end

      context 'not valid data' do
        it 'renders the edit template' do
          attributes_for(:clinic)
          patch :update, { id: clinic.id, clinic: {title: clinic.title, email: nil }}
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'POST #destroy' do
      it 'redirect to index' do
        delete :destroy, { id: clinic.id}
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
        get :show, { id: clinic.id}
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
        get :edit, { id: clinic.id}
        expect(response).to admin_sign_in
      end
    end
  end
end

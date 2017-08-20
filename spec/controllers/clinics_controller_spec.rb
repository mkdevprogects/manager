require 'rails_helper'

RSpec.describe ClinicsController, type: :controller do
  render_views
  let(:admin) { create(:admin) }
  let(:clinic) { create(:clinic) }

  context 'signed in' do
    before { sign_in admin }

    describe "GET #index" do
      let!(:clinic_1) { create(:clinic) }
      let!(:clinic_2) { create(:clinic) }

      before { get :index }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        expect(response).to render_template("index")
      end

      it "loads all clinics" do
        expect(assigns(:clinics)).to match_array([clinic_1, clinic_2])
      end

      it "page have clinics title" do
        expect(response.body).to include("#{clinic_1.title}","#{clinic_2.title}")
      end
    end

    describe "GET #show" do
      let(:specialization) { create(:specialization) }
      let(:doctor) { create(:doctor, specializations: [specialization]) }
      let(:clinic) { create(:clinic, doctors: [doctor]) }

      before { get :show, { id: clinic.id} }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the show template" do
        expect(response).to render_template("show")
      end

      it "load clinic" do
        expect(assigns(:clinic)).to eq(clinic)
      end

      it "page have clinics title" do
        expect(response.body).to include("#{clinic.title}")
      end

      it "page have clinics specializations" do
        expect(response.body).to include("#{clinic.specializations_titles.first}")
      end

      it "page have clinics doctor" do
        expect(response.body).to include("#{doctor.surname_name}")
      end
    end

    describe "GET #new" do
      before { get :new }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        expect(response).to render_template("new")
      end
    end

    describe "GET #edit" do
      before { get :edit, { id: clinic.id} }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        expect(response).to render_template("edit")
      end

      it "page have clinics title" do
        expect(response.body).to include("#{clinic.title}")
      end

      it "page have clinics phone" do
        expect(response.body).to include("#{clinic.phone}")
      end

      it "page have clinics email" do
        expect(response.body).to include("#{clinic.email}")
      end

      it "page have clinics address" do
        expect(response.body).to include("#{clinic.address}")
      end
    end

    describe "POST #create" do
      it "returns http 302" do
        post :create, { id: clinic.id, title: clinic.title, email: clinic.email}
        expect(response).to have_http_status(302)
      end
    end

    describe "POST #update" do
      it "returns http 302" do
        patch :update, { id: clinic.id}
        expect(response).to have_http_status(302)
      end
    end

    describe "POST #destroy" do
      it "returns http 302" do
        delete :destroy, { id: clinic.id}
        expect(response).to have_http_status(302)
      end
    end
  end

  context 'guest' do
    describe "GET #index" do
      it "returns http 302" do
        get :index
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #show" do
      it "returns http 302" do
        get :show, { id: clinic.id}
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #new" do
      it "returns http 302" do
        get :new
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #edit" do
      it "returns http 302" do
        get :edit, { id: clinic.id}
        expect(response).to have_http_status(302)
      end
    end
  end
end

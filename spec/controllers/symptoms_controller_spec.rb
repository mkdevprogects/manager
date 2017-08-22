require 'rails_helper'

RSpec.describe SymptomsController, type: :controller do
  render_views

  let(:symptom) { create(:symptom) }

  context 'signed in' do
    let(:admin) { create(:admin) }

    before { sign_in admin }
    describe "GET #index" do
      let!(:symptom_1) { create(:symptom) }
      let!(:symptom_2) { create(:symptom) }

      before { get :index }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        expect(response).to render_template("index")
      end

      it "loads all symptoms" do
        expect(assigns(:symptoms)).to match_array([symptom_1, symptom_2])
      end

      it "page have symptoms title" do
        expect(response.body).to include("#{symptom_1.title}","#{symptom_2.title}")
      end
    end

    describe "GET #show" do
      let(:symptom) { create(:symptom, diseases: [create(:disease)]) }

      before { get :show, { id: symptom.id} }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the show template" do
        expect(response).to render_template("show")
      end

      it "load symptom" do
        expect(assigns(:symptom)).to eq(symptom)
      end

      it "page have symptoms title" do
        expect(response.body).to include("#{symptom.title}")
      end

      it "page have symptoms description" do
        expect(response.body).to include("#{symptom.description}")
      end

      it "page have symptoms disease" do
        expect(response.body).to include("#{symptom.diseases.first.title}")
      end
    end

    describe "GET #new" do
      before { get :new }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end

    describe "GET #edit" do
      before { get :edit, { id: symptom.id} }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the edit template" do
        expect(response).to render_template("edit")
      end

      it "page have symptoms title" do
        expect(response.body).to include("#{symptom.title}")
      end

      it "page have symptoms description" do
        expect(response.body).to include("#{symptom.description}")
      end
    end

    describe "POST #create" do
      it "returns http 302" do
        post :create, { symptom: { title: symptom.title }}
        expect(response).to have_http_status(302)
      end
    end

    describe "POST #update" do
      it "returns http 302" do
        patch :update, { id: symptom.id, symptom: { title: symptom.title }}
        expect(response).to have_http_status(302)
      end
    end

    describe "POST #destroy" do
      it "returns http 302" do
        delete :destroy, { id: symptom.id}
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
        get :show, { id: symptom.id}
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
        get :edit, { id: symptom.id}
        expect(response).to have_http_status(302)
      end
    end
  end
end

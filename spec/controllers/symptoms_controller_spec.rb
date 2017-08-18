require 'rails_helper'

RSpec.describe SymptomsController, type: :controller do
  let(:symptom) { create(:symptom) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, { id: symptom.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, { id: symptom.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http 302" do
      post :create, { id: symptom.id, title: symptom.title}
      expect(response).to have_http_status(302)
    end
  end

  describe "POST #update" do
    it "returns http 302" do
      patch :update, { id: symptom.id}
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

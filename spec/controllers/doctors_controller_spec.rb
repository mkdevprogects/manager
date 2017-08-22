require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do
  render_views

  let(:doctor) { create(:doctor)}

  context 'signed in' do
    let(:admin) { create(:admin) }

    before { sign_in admin }

    describe "GET #index" do
      let!(:doctor_1) { create(:doctor) }
      let!(:doctor_2) { create(:doctor) }
      before { get :index }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        expect(response).to render_template("index")
      end

      it "loads all doctors" do
        expect(assigns(:doctors)).to match_array([doctor_1, doctor_2])
      end

      it "page have doctors full name" do
        expect(response.body).to include("#{doctor_1.surname_name}","#{doctor_2.surname_name}")
      end
    end

    describe "GET #show" do
      let(:doctor) { create(
          :doctor,
          specializations: [create(:specialization)],
          clinics: [create(:clinic)],
          grades: [create(:grade)]
      ) }

      before { get :show, { id: doctor.id} }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the show template" do
        expect(response).to render_template("show")
      end

      it "load doctor" do
        expect(assigns(:doctor)).to eq(doctor)
      end

      it "page have doctors name and surname" do
        expect(response.body).to include("#{doctor.surname_name}")
      end

      it "page have doctors phone" do
        expect(response.body).to include("#{doctor.phone}")
      end

      it "page have doctors email" do
        expect(response.body).to include("#{doctor.email}")
      end

      it "page have doctors grade" do
        expect(response.body).to include("#{doctor.grades.first.title}")
      end

      it "page have doctors specializations" do
        expect(response.body).to include("#{doctor.specializations.first.title}")
      end

      it "page have doctors clinic" do
        expect(response.body).to include("#{doctor.clinics.first.title}")
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
      before { get :edit, { id: doctor.id} }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the edit template" do
        expect(response).to render_template("edit")
      end

      it "page have doctors name" do
        expect(response.body).to include("#{doctor.name}")
      end

      it "page have doctors surname" do
        expect(response.body).to include("#{doctor.surname}")
      end

      it "page have doctors patronymic" do
        expect(response.body).to include("#{doctor.patronymic}")
      end

      it "page have doctors phone" do
        expect(response.body).to include("#{doctor.phone}")
      end

      it "page have doctors email" do
        expect(response.body).to include("#{doctor.email}")
      end
    end

    describe "GET #destroy" do
      it "returns http 302" do
        delete :destroy, { id: doctor.id }
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #create" do
      it "returns http 302" do
        post :create, { doctor: {name: doctor.name, surname: doctor.surname, email: doctor.email }}
        expect(response).to have_http_status(200)
      end
    end

    describe "GET #update" do
      it "returns http 302" do
        patch :update, { id: doctor.id, doctor: {name: doctor.name, surname: doctor.surname, email: doctor.email }}
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
        get :show, { id: doctor.id }
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
        get :edit, { id: doctor.id }
        expect(response).to have_http_status(302)
      end
    end
  end
end

class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  def index
    @clinics = Clinic.all.decorate
  end

  def show
  end

  def new
    @clinic = Clinic.new.decorate
  end

  def edit
  end

  def create
    @clinic = Clinic.new(clinic_params).decorate
    if @clinic.save
      redirect_to @clinic, notice: 'Клиника успешно создана.'
    else
      render :new
    end
  end

  def update
    if @clinic.update(clinic_params)
      redirect_to @clinic, notice: 'Клиника успешно изменена.'
    else
      render :edit
    end
  end

  def destroy
    @clinic.destroy
    redirect_to clinics_url, notice: 'Клиника успешно удалена.'
  end
  
  private
  
  def set_clinic
    @clinic = Clinic.find(params[:id]).decorate
  end
  
  def clinic_params
    params.require(:clinic).permit(:title, :email, :phone, :address, doctor_ids: [])
  end
end

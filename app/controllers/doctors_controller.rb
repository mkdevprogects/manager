class DoctorsController < BaseController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all.decorate
  end

  def show
  end

  def new
    @doctor = Doctor.new.decorate
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params).decorate
    if @doctor.save
      redirect_to @doctor, notice: 'Врач успешно создан.'
      record(current_admin, @doctor, "create")
    else
      render :new
    end
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: 'Врач успешно изменен.'
      record(current_admin, @doctor, "update")
    else
      render :new
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_url, notice: 'Врач успешно удален.'
    record(current_admin, @doctor, "destroy")
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id]).decorate
  end

  def doctor_params
    params.require(:doctor).permit(
        :name,
        :surname,
        :patronymic,
        :phone,
        :email,
        clinic_ids: [],
        specialization_ids: [],
        grade_ids: []
    )
  end
end

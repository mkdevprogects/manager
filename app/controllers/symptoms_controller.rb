class SymptomsController < BaseController
  before_action :set_symptom, only: [:show, :edit, :update, :destroy]

  def index
    @symptoms = Symptom.all.decorate
  end

  def show
  end

  def new
    @symptom = Symptom.new.decorate
    @diseases = Disease.all
  end

  def edit
  end

  def create
    @symptom = Symptom.new(symptom_params).decorate
    if @symptom.save
      redirect_to @symptom, notice: 'Симптом успешно создан.'
    else
      render :new
    end
  end

  def update
    if @symptom.update(symptom_params)
      redirect_to @symptom, notice: 'Симптом успешно изменен.'
    else
      render :new
    end
  end

  def destroy
    @symptom.destroy
    redirect_to symptoms_url, notice: 'Симптом успешно удален.'
  end

  private

  def set_symptom
    @symptom = Symptom.find(params[:id]).decorate
  end

  def symptom_params
    params.require(:symptom).permit(:title, :description, disease_ids: [])
  end
end

class DiseasesController < BaseController
  before_action :set_disease, only: [:show, :edit, :update, :destroy]

  def index
    @diseases = Disease.all
  end

  def show
  end

  def new
    @disease = Disease.new.decorate
    @symptoms = Symptom.all
    @specializations = Specialization.all
  end

  def edit
  end

  def create
    @disease = Disease.new(disease_params).decorate
    if @disease.save
      redirect_to @disease, notice: 'Болезнь успешно создана.'
    else
      render :new
    end
  end

  def update
    if @disease.update(disease_params)
      redirect_to @disease, notice: 'Болезнь успешно изменена.'
    else
      render :edit
    end
  end

  def destroy
    @disease.destroy
    redirect_to diseases_url, notice: 'Болезнь успешно удалена.'
  end

  private

  def set_disease
    @disease = Disease.find(params[:id]).decorate
  end

  def disease_params
    params.require(:disease).permit(
        :title,
        :description,
        :icd_code,
        symptom_ids: [],
        specialization_ids: []
    )
  end
end

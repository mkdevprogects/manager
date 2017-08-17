class SymptomsController < ApplicationController
  before_action :set_symptom, only: [:show, :edit, :update, :destroy]

  def index
    @symptoms = Symptom.all
  end

  def show
  end

  def new
    @symptom = Symptom.new
    @diseases = Disease.all
  end

  def edit
  end

  def create
    @symptom = Symptom.new(symptom_params)
    # diseases = Disease.where(id: symptom_params['diseases'])
    # @symptom.diseases << diseases
    @symptom.save!
    # symptom_params['diseases'].compact.each do |disease_id|
    #   DiseaseSymptom.create!(disease_id: disease_id, symptom_id: @symptom.id)
    # end
    if @symptom.save
      redirect_to @symptom, notice: 'Симптом успешно создан.'
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_symptom
    @symptom = Symptom.find(params[:id])
  end

  def symptom_params
    params.require(:symptom).permit(:title, :description, :diseases, :disease_ids)
  end
end

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
    params.require(:symptom).permit(:title, :description, disease_ids: [])
  end
end

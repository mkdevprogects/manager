class Symptom < ActiveRecord::Base
  has_many :disease_symptoms
  has_many :diseases, through: :disease_symptoms

  validates :title, presence: true
end

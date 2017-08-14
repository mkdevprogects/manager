class Doctor < ActiveRecord::Base
  has_many :doctor_specializations
  has_many :specializations, through: :doctor_specializations

  has_many :doctor_grades
  has_many :grades, through: :doctor_grades

  validates :name, :surname, presence: true
  validates :email, presence: true, uniqueness: true
end

class Clinic < ActiveRecord::Base
  has_many :practices
  has_many :doctors, through: :practices

  has_many :visits

  validates :title, presence: true
  validates :email, presence: true, uniqueness: true
end

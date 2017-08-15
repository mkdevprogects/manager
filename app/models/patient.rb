class Patient < ActiveRecord::Base
  has_many :illnesses
  has_many :doctors, through: :illnesses

  validates :email, presence: true, uniqueness: true
end

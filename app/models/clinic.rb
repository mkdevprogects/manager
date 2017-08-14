class Clinic < ActiveRecord::Base
  validates :title, presence: true
  validates :email, presence: true, uniqueness: true
end

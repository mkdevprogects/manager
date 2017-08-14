class Specialization < ActiveRecord::Base
  validates :alias_name, :doctor_title, presence: true, uniqueness: true
end

class Specialization < ActiveRecord::Base
  validates :title, :code, presence: true
end

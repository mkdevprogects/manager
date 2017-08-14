class Symptom < ActiveRecord::Base
  validates :title, presence: true
end

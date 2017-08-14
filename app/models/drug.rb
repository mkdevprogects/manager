class Drug < ActiveRecord::Base
  validates :title, presence: true
end

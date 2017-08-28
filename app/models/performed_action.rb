class PerformedAction < ActiveRecord::Base
  belongs_to :actor, polymorphic: true
  belongs_to :subject, polymorphic: true
end

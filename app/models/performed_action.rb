class PerformedAction < ActiveRecord::Base
  belongs_to :actor, polymorphic: true
  belongs_to :subject, polymorphic: true

  ransack_alias :search, :actor_of_Admin_type_name_or_actor_of_Admin_id_id_or_subject_of_Clinic_type_title_or_action_or_created_at
end

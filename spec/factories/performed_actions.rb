FactoryGirl.define do
  factory :performed_action do
    sequence(:actor_id) { |n| n }
    sequence(:subject_id) { |n| n }
    sequence(:actor_type) do
      actors = ['Admin', 'Doctor', 'Patient']
      actors[rand(0..2)]
    end
    sequence(:action) do
      actions = [
          I18n.t('actions.create'),
          I18n.t('actions.edit'),
          I18n.t('actions.delete')
      ]
      actions[rand(0..2)]
    end
    sequence(:subject_type) do
      subjects = ['Clinic', 'Doctor', 'Symptom', 'Disease']
      subjects[rand(0..3)]
    end
  end
end
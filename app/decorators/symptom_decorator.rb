class SymptomDecorator < Draper::Decorator
  include PageData

  delegate_all
end

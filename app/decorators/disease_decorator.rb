class DiseaseDecorator < Draper::Decorator
  include PageData

  delegate_all
end

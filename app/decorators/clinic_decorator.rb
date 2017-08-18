class ClinicDecorator < Draper::Decorator
  include PageData

  delegate_all
end

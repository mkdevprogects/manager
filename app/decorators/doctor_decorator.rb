class DoctorDecorator < Draper::Decorator
  include PageData

  delegate_all

  def surname_name
    "#{object.surname} #{object.name}"
  end
end

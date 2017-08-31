class DoctorDecorator < Draper::Decorator
  include PageData

  delegate_all

  def full_name
    "#{object.surname} #{object.name}"
  end
end

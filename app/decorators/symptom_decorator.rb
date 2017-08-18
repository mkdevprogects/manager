class SymptomDecorator < Draper::Decorator
  delegate_all

  def pages_title
    if object.new_record?
      'Создать'
    else
      'Изменить'
    end
  end

end

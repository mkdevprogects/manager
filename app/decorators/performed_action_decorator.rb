class PerformedActionDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def action
    if object.action == 'create'
      t('actions.create')
    elsif object.action == 'update'
      t('actions.edit')
    elsif object.action == 'destroy'
      t('actions.delete')
    end
  end

end

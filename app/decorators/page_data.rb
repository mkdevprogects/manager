module PageData
  include Draper::LazyHelpers

  def pages_title
    if object.new_record?
      t('clinics.actions.create')
    else
      t('clinics.actions.edit')
    end
  end
end
module PageData
  include Draper::LazyHelpers

  def pages_title
    if object.new_record?
      t('clinics.new.title')
    else
      t('clinics.edit.title')
    end
  end
end
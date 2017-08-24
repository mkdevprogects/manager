module PageData
  include Draper::LazyHelpers

  def pages_title
    if object.new_record?
      t('actions.create')
    else
      t('actions.edit')
    end
  end
end
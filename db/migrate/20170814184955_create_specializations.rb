class CreateSpecializations < ActiveRecord::Migration
  def change
    create_table :specializations do |t|
      t.string :doctor_title, null: false, uniq: true
      t.string :clinic_title
      t.string :alias_name, null: false, uniq: true

      t.timestamps null: false
    end
  end
end

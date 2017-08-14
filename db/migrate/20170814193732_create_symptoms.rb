class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.string :title, null: false, uniq: true
      t.string :description
    end
  end
end

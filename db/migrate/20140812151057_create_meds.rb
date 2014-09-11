class CreateMeds < ActiveRecord::Migration
  def change
    create_table :meds do |t|
      t.string :name
      t.string :instructions
      t.string :patient_id

      t.timestamps
    end
  end
end

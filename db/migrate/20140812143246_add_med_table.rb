class AddMedTable < ActiveRecord::Migration
  def change
    create_table :meds do |t|
      t.string :name
      t.string :instruction
      

      t.timestamps

    end
  end
end

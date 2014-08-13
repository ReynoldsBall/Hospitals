class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.text :description
      t.integer :doctorable_id
      t.string :doctorable_type
      t.timestamps
    end
  end
end

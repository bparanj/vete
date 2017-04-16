class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :name, :limit => 35
      t.string :address
      t.string :city
      t.string :state
      t.string :zip, :limit => 5
      t.string :school
      t.integer :experience
      t.boolean :owner, :default => false

      t.timestamps
    end
  end
end
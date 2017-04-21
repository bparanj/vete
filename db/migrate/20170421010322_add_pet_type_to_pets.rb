class AddPetTypeToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :category, :string
  end
end

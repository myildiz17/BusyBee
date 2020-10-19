class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.integer :neighbor_id
      t.string :name
      t.string :breed
      t.integer :age

      t.timestamps
    end
  end
end

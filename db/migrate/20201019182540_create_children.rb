class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.integer :neighbor_id
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end

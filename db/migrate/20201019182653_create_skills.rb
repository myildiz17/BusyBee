class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.integer :worker_bee_id
      t.string :name

      t.timestamps
    end
  end
end

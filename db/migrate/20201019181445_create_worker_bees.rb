class CreateWorkerBees < ActiveRecord::Migration[6.0]
  def change
    create_table :worker_bees do |t|
      t.string :name
      t.integer :age
      t.string :skill_set
      t.boolean :availability
      t.float :rate

      t.timestamps
    end
  end
end

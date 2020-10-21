class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :neighbor_id
      t.integer :worker_bee_id
      t.string :category
      t.float :total_time
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end

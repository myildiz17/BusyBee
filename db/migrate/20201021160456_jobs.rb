class Jobs < ActiveRecord::Migration[6.0]
  def change
    create_table "jobs", force: :cascade do |t|
      t.integer :neighbor_id
      t.integer :worker_bee_id
      t.string :category
      t.float :total_time
      t.string :date
      t.string :time
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
    end
  end 

end

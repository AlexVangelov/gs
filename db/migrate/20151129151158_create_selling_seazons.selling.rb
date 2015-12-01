# This migration comes from selling (originally 20151129144835)
class CreateSellingSeazons < ActiveRecord::Migration
  def change
    create_table :selling_seazons do |t|
      t.string :name
      t.date :from
      t.integer :master_id

      t.timestamps null: false
    end
  end
end

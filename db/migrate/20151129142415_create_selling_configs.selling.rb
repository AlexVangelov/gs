# This migration comes from selling (originally 20151128191807)
class CreateSellingConfigs < ActiveRecord::Migration
  def change
    create_table :selling_configs do |t|
      t.integer :master_id

      t.timestamps null: false
    end
  end
end

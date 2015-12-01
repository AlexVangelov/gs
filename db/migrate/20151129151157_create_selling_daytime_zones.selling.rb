# This migration comes from selling (originally 20151129144807)
class CreateSellingDaytimeZones < ActiveRecord::Migration
  def change
    create_table :selling_daytime_zones do |t|
      t.string :name
      t.time :from
      t.integer :master_id

      t.timestamps null: false
    end
  end
end

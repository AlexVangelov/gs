# This migration comes from selling (originally 20151129145942)
class CreateSellingRates < ActiveRecord::Migration
  def change
    create_table :selling_rates do |t|
      t.integer :master_id
      t.belongs_to :resource_type, index: true, foreign_key: true
      t.belongs_to :seazon, index: true, foreign_key: true
      t.belongs_to :daytime_zone, index: true, foreign_key: true
      t.integer :plu_id

      t.timestamps null: false
    end
  end
end

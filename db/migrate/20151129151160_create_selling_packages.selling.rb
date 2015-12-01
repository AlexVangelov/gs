# This migration comes from selling (originally 20151129150125)
class CreateSellingPackages < ActiveRecord::Migration
  def change
    create_table :selling_packages do |t|
      t.integer :master_id
      t.belongs_to :resource_type, index: true, foreign_key: true
      t.belongs_to :seazon, index: true, foreign_key: true
      t.belongs_to :daytime_zone, index: true, foreign_key: true
      t.integer :months
      t.integer :days
      t.integer :stay
      t.decimal :qty, precision: 6, scale: 3
      t.integer :plu_id
      t.boolean :recurring
      t.string :type

      t.timestamps null: false
    end
  end
end

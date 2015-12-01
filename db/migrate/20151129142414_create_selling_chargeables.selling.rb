# This migration comes from selling (originally 20151128190429)
class CreateSellingChargeables < ActiveRecord::Migration
  def change
    create_table :selling_chargeables do |t|
      t.belongs_to :billable, index: true, foreign_key: true
      t.references :holdable, polymorphic: true, index: true
      t.integer :master_id
      t.string :type

      t.timestamps null: false
    end
  end
end

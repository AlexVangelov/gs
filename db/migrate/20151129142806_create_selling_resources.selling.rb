# This migration comes from selling (originally 20151129142004)
class CreateSellingResources < ActiveRecord::Migration
  def change
    create_table :selling_resources do |t|
      t.string :name
      t.belongs_to :resource_type, index: true, foreign_key: true
      t.integer :master_id

      t.timestamps null: false
    end
  end
end

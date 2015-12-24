# This migration comes from selling (originally 20151207022904)
class AddSellableToSellingConfig < ActiveRecord::Migration
  def change
    add_column :selling_configs, :sellable_id, :integer
    add_column :selling_configs, :sellable_type, :string
    add_index :selling_configs, [:sellable_id, :sellable_type]
  end
end

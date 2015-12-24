# This migration comes from selling (originally 20151207021756)
class AddDefaultOriginToSellingConfig < ActiveRecord::Migration
  def change
    add_column :selling_configs, :default_origin_id, :integer
  end
end

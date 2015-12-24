# This migration comes from selling (originally 20151207033301)
class AddDefaultProfileToSellingConfig < ActiveRecord::Migration
  def change
    add_column :selling_configs, :default_profile_id, :integer
  end
end

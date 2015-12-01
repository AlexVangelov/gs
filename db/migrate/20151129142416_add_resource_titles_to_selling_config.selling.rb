# This migration comes from selling (originally 20151128193610)
class AddResourceTitlesToSellingConfig < ActiveRecord::Migration
  def change
    add_column :selling_configs, :profile_title, :string
    add_column :selling_configs, :resource_title, :string
    add_column :selling_configs, :resource_type_title, :string
    add_column :selling_configs, :occupation_title, :string
  end
end

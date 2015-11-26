# This migration comes from billing (originally 20150510142229)
class AddObjectChangesToBillingVersions < ActiveRecord::Migration
  def change
    add_column :billing_versions, :object_changes, :text
  end
end

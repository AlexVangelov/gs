# This migration comes from billing (originally 20150512040421)
class AddDeletedAtToBillingReport < ActiveRecord::Migration
  def change
    add_column :billing_reports, :deleted_at, :timestamp
  end
end

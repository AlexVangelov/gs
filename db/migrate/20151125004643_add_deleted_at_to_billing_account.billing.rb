# This migration comes from billing (originally 20140729182146)
class AddDeletedAtToBillingAccount < ActiveRecord::Migration
  def change
    add_column :billing_accounts, :deleted_at, :timestamp, index: true
  end
end

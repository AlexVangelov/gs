# This migration comes from billing (originally 20140728110230)
class AddAutofinAndFinalizedAtToBillingAccount < ActiveRecord::Migration
  def change
    add_column :billing_accounts, :autofin, :boolean, default: true
    add_column :billing_accounts, :finalized_at, :timestamp
  end
end

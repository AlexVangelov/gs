# This migration comes from billing (originally 20140803073707)
class RenameBillingAccountToBill < ActiveRecord::Migration
  def change
    rename_table :billing_accounts, :billing_bills
    rename_column :billing_charges, :account_id, :bill_id
    rename_column :billing_modifiers, :account_id, :bill_id
    rename_column :billing_payments, :account_id, :bill_id
  end
end

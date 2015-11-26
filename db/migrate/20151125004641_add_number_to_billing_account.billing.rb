# This migration comes from billing (originally 20140729083408)
class AddNumberToBillingAccount < ActiveRecord::Migration
  def change
    add_column :billing_accounts, :number, :string
  end
end

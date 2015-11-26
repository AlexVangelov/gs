# This migration comes from billing (originally 20140729083050)
class AddNameToBillingAccount < ActiveRecord::Migration
  def change
    add_column :billing_accounts, :name, :string
  end
end

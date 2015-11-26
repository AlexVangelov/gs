# This migration comes from billing (originally 20140725122914)
class AddStatusToBillingPayment < ActiveRecord::Migration
  def change
    add_column :billing_payments, :status, :string
  end
end

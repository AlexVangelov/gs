# This migration comes from billing (originally 20140720110811)
class AddTypeToBillingPayment < ActiveRecord::Migration
  def change
    add_column :billing_payments, :type, :string
    add_column :billing_payments, :payment_type_id, :integer
  end
end

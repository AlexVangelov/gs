# This migration comes from billing (originally 20140720132559)
class AddTypeToBillingPaymentType < ActiveRecord::Migration
  def change
    add_column :billing_payment_types, :type, :string
  end
end

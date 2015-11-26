# This migration comes from billing (originally 20140804070517)
class AddTaxRatioToBillingCharge < ActiveRecord::Migration
  def change
    add_column :billing_charges, :tax_ratio, :decimal, precision: 6, scale: 3
  end
end

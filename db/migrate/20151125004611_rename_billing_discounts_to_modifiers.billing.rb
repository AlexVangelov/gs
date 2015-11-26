# This migration comes from billing (originally 20140719103621)
class RenameBillingDiscountsToModifiers < ActiveRecord::Migration
  def change
    rename_table :billing_discounts, :billing_modifiers
  end
end

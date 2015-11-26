# This migration comes from billing (originally 20140718210349)
class AddFixedValueToBillingDiscount < ActiveRecord::Migration
  def change
    change_table :billing_discounts do |t|
      t.money :fixed_value
    end
  end
end

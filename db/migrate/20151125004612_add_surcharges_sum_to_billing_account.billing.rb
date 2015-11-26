# This migration comes from billing (originally 20140719110412)
class AddSurchargesSumToBillingAccount < ActiveRecord::Migration
  def change
    change_table :billing_accounts do |t|
      t.money :surcharges_sum
    end
  end
end

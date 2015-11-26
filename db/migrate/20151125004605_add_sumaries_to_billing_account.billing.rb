# This migration comes from billing (originally 20140718164841)
class AddSumariesToBillingAccount < ActiveRecord::Migration
  def change
    change_table :billing_accounts do |t|
      t.money :charges_sum
      t.money :discounts_sum
      t.money :payments_sum
      t.money :total
      t.money :balance
    end
  end
end

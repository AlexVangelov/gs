# This migration comes from billing (originally 20141027235427)
class AddFAmountToBillingReport < ActiveRecord::Migration
  def change
    change_table :billing_reports do |t|
      t.money :f_amount
    end
  end
end

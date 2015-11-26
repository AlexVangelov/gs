# This migration comes from billing (originally 20140724173527)
class AddOriginToBillingAccount < ActiveRecord::Migration
  def change
    change_table :billing_accounts do |t|
      t.belongs_to :origin, index: true
    end
  end
end

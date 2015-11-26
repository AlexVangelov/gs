# This migration comes from billing (originally 20140726163220)
class RenameClosureToBillingReport < ActiveRecord::Migration
  def change
    rename_table :billing_closures, :billing_reports
  end
end

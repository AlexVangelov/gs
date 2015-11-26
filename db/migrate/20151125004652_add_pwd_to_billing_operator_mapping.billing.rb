# This migration comes from billing (originally 20150311013019)
class AddPwdToBillingOperatorMapping < ActiveRecord::Migration
  def change
    add_column :billing_op_fp_mappings, :pwd, :string
  end
end

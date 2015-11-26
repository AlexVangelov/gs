# This migration comes from billing (originally 20140725145953)
class EqalizeSchemasBillingOperators < ActiveRecord::Migration
  def change
    add_index :billing_operators, :deleted_at
  end
end

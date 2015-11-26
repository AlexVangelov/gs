# This migration comes from billing (originally 20140725143734)
class EqalizeSchemasBillingDepartment < ActiveRecord::Migration
  def change
    add_index :billing_departments, :deleted_at
  end
end

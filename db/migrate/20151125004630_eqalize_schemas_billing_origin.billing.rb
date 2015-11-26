# This migration comes from billing (originally 20140725150329)
class EqalizeSchemasBillingOrigin < ActiveRecord::Migration
  def change
    add_index :billing_origins, :deleted_at
  end
end

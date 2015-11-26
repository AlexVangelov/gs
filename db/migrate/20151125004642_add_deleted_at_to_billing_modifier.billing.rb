# This migration comes from billing (originally 20140729180849)
class AddDeletedAtToBillingModifier < ActiveRecord::Migration
  def change
    add_column :billing_modifiers, :deleted_at, :timestamp, index: true
  end
end

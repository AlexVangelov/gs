# This migration comes from billing (originally 20140719094418)
class CreateBillingProfiles < ActiveRecord::Migration
  def change
    create_table :billing_profiles do |t|
      t.string :name

      t.timestamps
    end
  end
end

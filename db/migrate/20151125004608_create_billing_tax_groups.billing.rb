# This migration comes from billing (originally 20140719094023)
class CreateBillingTaxGroups < ActiveRecord::Migration
  def change
    create_table :billing_tax_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end

# This migration comes from billing (originally 20140719094033)
class CreateBillingPlus < ActiveRecord::Migration
  def change
    create_table :billing_plus do |t|
      t.string :name

      t.timestamps
    end
  end
end

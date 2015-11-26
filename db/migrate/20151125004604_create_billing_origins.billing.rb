# This migration comes from billing (originally 20140717202527)
class CreateBillingOrigins < ActiveRecord::Migration
  def change
    create_table :billing_origins do |t|
      t.string :name

      t.timestamps
    end
  end
end

# This migration comes from billing (originally 20140725164847)
class AddExtfaceJobToBillingAccount < ActiveRecord::Migration
  def change
    add_reference :billing_accounts, :extface_job, index: true
  end
end

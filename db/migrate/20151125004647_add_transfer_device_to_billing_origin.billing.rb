# This migration comes from billing (originally 20141001185321)
class AddTransferDeviceToBillingOrigin < ActiveRecord::Migration
  def change
    add_reference :billing_origins, :transfer_device, index: true
  end
end

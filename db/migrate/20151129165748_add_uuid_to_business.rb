class AddUuidToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :uuid, :string
  end
end

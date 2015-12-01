class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.belongs_to :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

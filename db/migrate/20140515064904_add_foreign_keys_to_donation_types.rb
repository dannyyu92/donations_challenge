class AddForeignKeysToDonationTypes < ActiveRecord::Migration
  def change
    add_column :items, :user_id, :integer
    add_column :vouchers, :user_id, :integer
    add_column :experiences, :user_id, :integer
  end
end

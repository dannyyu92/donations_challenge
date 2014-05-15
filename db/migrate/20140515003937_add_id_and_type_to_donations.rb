class AddIdAndTypeToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :donatable_id, :integer
    add_column :donations, :donatable_type, :string
  end
end

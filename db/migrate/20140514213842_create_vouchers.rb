class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.datetime :expiration_date

      t.timestamps
    end
  end
end

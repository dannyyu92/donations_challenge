class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :height
      t.float :width
      t.float :weight

      t.timestamps
    end
  end
end

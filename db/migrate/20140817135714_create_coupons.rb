class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code, :limit => 36, :null => false
      t.integer :type
      t.integer :value
      t.references :order
      t.boolean :used

      t.timestamps
    end
    add_index :coupons, :order_id
    add_index :coupons, :code, :unique => true
  end
end

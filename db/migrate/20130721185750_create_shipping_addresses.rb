class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.integer :backer_id
      t.integer :order_id
      t.string :name
      t.string :address1
      t.string :address2
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :country
      t.string :phone_number

      t.timestamps
    end
  end
end

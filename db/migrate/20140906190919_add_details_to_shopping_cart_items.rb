class AddDetailsToShoppingCartItems < ActiveRecord::Migration
  def change
    add_column :shopping_cart_items, :details, :text
  end
end

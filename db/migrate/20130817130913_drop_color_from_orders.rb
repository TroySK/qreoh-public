class DropColorFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :color
  end

  def down
    add_column :orders, :color, :string
  end
end

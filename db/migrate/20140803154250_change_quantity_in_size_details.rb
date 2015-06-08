class ChangeQuantityInSizeDetails < ActiveRecord::Migration
  def up
    remove_column :size_details, :quantity
    add_column :size_details, :quantity, :integer
  end

  def down
    remove_column :size_details, :quantity
    add_column :size_details, :quantity, :string
  end
end

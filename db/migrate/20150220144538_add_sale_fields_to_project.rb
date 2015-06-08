class AddSaleFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :on_sale, :boolean, :default => :false
    add_column :projects, :discounted_price, :integer, :default => 0
  end
end

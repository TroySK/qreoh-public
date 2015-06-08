class ChangePriceColumnInProject < ActiveRecord::Migration
  def change
    rename_column :projects, :price, :base_price
  end
end

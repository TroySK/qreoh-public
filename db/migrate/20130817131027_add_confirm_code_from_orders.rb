class AddConfirmCodeFromOrders < ActiveRecord::Migration
  def change
    add_column :orders, :confirm_code, :string
  end
end

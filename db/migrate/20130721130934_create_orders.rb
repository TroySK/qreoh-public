class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :color
      t.string :size

      t.timestamps
    end
  end
end

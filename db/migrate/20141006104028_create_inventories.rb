class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :project
      t.string :size, null: false
      t.integer :total, default: 0
      t.integer :sold, default: 0

      t.timestamps
    end
    add_index :inventories, :project_id
  end
end

class CreateSizeDetails < ActiveRecord::Migration
  def change
    create_table :size_details do |t|
      t.references :project
      t.string :size
      t.string :quantity

      t.timestamps
    end
    add_index :size_details, :project_id
  end
end

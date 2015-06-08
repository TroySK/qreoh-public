class CreateColorDetails < ActiveRecord::Migration
  def change
    create_table :color_details do |t|
      t.string :color
      t.integer :quantity
      t.references :project

      t.timestamps
    end
    add_index :color_details, :project_id
  end
end

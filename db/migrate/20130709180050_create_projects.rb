class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :designer_id
      t.integer :category_id
      t.string :title
      t.text :desc
      t.text :description
      t.text :size_text
      t.string :size_image_file
      t.string :material
      t.string :color
      t.integer :location_id
      t.datetime :end_date
      t.integer :production_time
      t.datetime :shipping_date
      t.text :challenges
      t.decimal :price
      t.integer :quantity
      t.text :about
      t.boolean :status

      t.timestamps
    end
  end
end

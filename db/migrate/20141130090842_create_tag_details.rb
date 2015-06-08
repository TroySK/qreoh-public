class CreateTagDetails < ActiveRecord::Migration
  def change
    create_table :tag_details do |t|
      t.integer :tag_id
      t.text :description

      t.timestamps
    end
  end
end

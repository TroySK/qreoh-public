class CreateProjectPhotos < ActiveRecord::Migration
  def change
    create_table :project_photos do |t|
      t.integer :designer_id
      t.integer :project_id
      t.string :image

      t.timestamps
    end
  end
end

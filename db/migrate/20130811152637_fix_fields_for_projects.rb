class FixFieldsForProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :size_image_file
    remove_column :projects, :location_id
    remove_column :projects, :shipping_date
    rename_column :projects, :production_time, :production_days
    add_column :projects, :material_details, :text
    add_column :projects, :tags, :string
    add_column :projects, :duration, :integer
    add_column :projects, :start_date, :datetime
  end

  def down
    add_column :projects, :size_image_file
    add_column :projects, :location_id
    add_column :projects, :shipping_date
    rename_column :projects, :production_days, :production_time
    remove_column :projects, :material_details, :text
    remove_column :projects, :tags, :string
    remove_column :projects, :duration, :integer
    remove_column :projects, :start_date, :datetime
  end
end

class AddTitleToColorDetails < ActiveRecord::Migration
  def change
  	add_column :color_details, :title, :string
  end
end

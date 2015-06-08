class AddTagsToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :tags, :string
  end
end

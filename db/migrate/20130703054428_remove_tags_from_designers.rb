class RemoveTagsFromDesigners < ActiveRecord::Migration
  def up
    remove_column :designers, :tags
  end

  def down
    add_column :designers, :tags, :string
  end
end

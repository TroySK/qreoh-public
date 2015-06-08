class AddSlugToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :slug, :string
    add_index :designers, :slug
  end
end

class ChangeSocialConnectsToLinks < ActiveRecord::Migration
  def up
    remove_column :designers, :social_connects
    add_column :designers, :facebook, :string
    add_column :designers, :pinterest, :string
    add_column :designers, :behance, :string
    add_column :designers, :linkedin, :string
    add_column :designers, :slideshare, :string
  end

  def down
    add_column :designers, :social_connects, :text
    remove_column :designers, :facebook, :string
    remove_column :designers, :pinterest, :string
    remove_column :designers, :behance, :string
    remove_column :designers, :linkedin, :string
    remove_column :designers, :slideshare, :string
  end
end

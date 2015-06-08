class AddInstagramToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :instagram, :string
  end
end

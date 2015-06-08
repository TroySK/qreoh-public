class AddAvatarToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :avatar, :string
  end
end

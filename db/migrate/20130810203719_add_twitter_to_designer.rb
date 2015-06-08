class AddTwitterToDesigner < ActiveRecord::Migration
  def change
    add_column :designers, :twitter, :string
  end
end

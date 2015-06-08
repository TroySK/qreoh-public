class AddLocationToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :location, :string
  end
end

class AddCurrentCollectionToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :current_collection, :string
  end
end

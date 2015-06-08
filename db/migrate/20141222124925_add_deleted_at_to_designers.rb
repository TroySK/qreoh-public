class AddDeletedAtToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :deleted_at, :datetime
    add_index :designers, :deleted_at
  end
end

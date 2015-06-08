class RenameColumnToOrder < ActiveRecord::Migration
  def up
  	rename_column :orders, :user_id, :backer_id
  end

  def down
  	rename_column :orders, :backer_id, :user_id
  end
end

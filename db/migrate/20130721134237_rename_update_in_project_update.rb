class RenameUpdateInProjectUpdate < ActiveRecord::Migration
  def up
    rename_column :project_updates, :update, :update_text
  end

  def down
    rename_column :project_updates, :update_text, :update
  end
end

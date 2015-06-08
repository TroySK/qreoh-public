class SetOoakDefaultForProjects < ActiveRecord::Migration
  def up
    change_column_default(:projects, :ooak, true)
  end

  def down
    change_column_default(:projects, :ooak, false)
  end
end

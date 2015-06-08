class FixMoreFieldsForProjects < ActiveRecord::Migration
  def up
    add_column :projects, :location, :string
    remove_column :projects, :status
    add_column :projects, :status, :integer
  end

  def down
    remove_column :projects, :location, :string
    remove_column :projects, :status
    add_column :projects, :status, :boolean

  end
end

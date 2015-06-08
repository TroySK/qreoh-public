class AddOoakToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :ooak, :boolean, :default => false
  end
end

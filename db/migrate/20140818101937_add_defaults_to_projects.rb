class AddDefaultsToProjects < ActiveRecord::Migration
  def change
  	change_column :projects, :status, :integer, :default => 0
  end
end

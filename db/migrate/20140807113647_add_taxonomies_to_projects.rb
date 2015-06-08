class AddTaxonomiesToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :taxonomy, :integer
  end
end

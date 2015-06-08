class CreateTrendingProjects < ActiveRecord::Migration
  def change
    create_table :trending_projects do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end

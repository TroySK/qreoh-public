class CreatePopularProjects < ActiveRecord::Migration
  def change
    create_table :popular_projects do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end

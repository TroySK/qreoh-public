class CreateHotRightNowProjects < ActiveRecord::Migration
  def change
    create_table :hot_right_now_projects do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end

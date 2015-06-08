class CreateProjectUpdates < ActiveRecord::Migration
  def change
    create_table :project_updates do |t|
      t.integer :project_id
      t.text :update

      t.timestamps
    end
  end
end

class CreateEditorPicks < ActiveRecord::Migration
  def change
    create_table :editor_picks do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end

class CreateRecentDesigners < ActiveRecord::Migration
  def change
    create_table :recent_designers do |t|
      t.integer :designer_id

      t.timestamps
    end
  end
end

class CreatePopularDesigners < ActiveRecord::Migration
  def change
    create_table :popular_designers do |t|
      t.integer :designer_id

      t.timestamps
    end
  end
end

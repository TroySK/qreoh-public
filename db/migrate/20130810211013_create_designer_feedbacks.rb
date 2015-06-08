class CreateDesignerFeedbacks < ActiveRecord::Migration
  def change
    create_table :designer_feedbacks do |t|
      t.integer :designer_id
      t.integer :user_id
      t.text :feedback_text

      t.timestamps
    end
  end
end

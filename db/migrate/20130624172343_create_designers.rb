class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.integer :user_id
      t.string :name
      t.text :about
      t.text :social_connects
      t.timestamps
    end
  end
end

class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.text :message
      t.boolean :trashed, :default => false

      t.timestamps
    end
  end
end

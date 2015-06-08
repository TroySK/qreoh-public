class AddIndexesToQreoh < ActiveRecord::Migration
  def change
    add_index :authorizations, :user_id
    add_index :authorizations, :uid
    add_index :backers, :user_id
    add_index :designers, :user_id
    add_index :designer_feedbacks, :designer_id
    add_index :designer_feedbacks, :user_id
    add_index :favorites, :user_id
    add_index :favorites, :project_id
    add_index :messages, :recipient_id
    add_index :messages, :user_id
    add_index :messages, :project_id
    add_index :orders, :project_id
    add_index :orders, :backer_id
    add_index :projects, :designer_id
    add_index :projects, :category_id
    add_index :project_photos, :project_id
    add_index :project_photos, :designer_id
    add_index :project_updates, :project_id
    add_index :shipping_addresses, :backer_id
    add_index :shipping_addresses, :order_id
  end
end

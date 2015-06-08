class CreateTumblrPosts < ActiveRecord::Migration
  def change
    create_table :tumblr_posts do |t|
      t.text :title
      t.text :image
      t.string :url

      t.timestamps
    end
  end
end

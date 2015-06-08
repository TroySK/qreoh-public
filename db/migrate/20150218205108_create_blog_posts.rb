class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :image
      t.text :summary
      t.string :url
      t.string :guid

      t.timestamps
    end
  end
end

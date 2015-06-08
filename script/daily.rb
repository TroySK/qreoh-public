# Blog Posts
BlogPost.update_entries
puts "Blog Posts updated!"

# Tumblr Posts
TumblrPost.sync
puts "Tumblrolled!"

# New In Tags Updating
ActsAsTaggableOn::Tagging.where(:tag_id => 3).delete_all
new_in_tag = ActsAsTaggableOn::Tag.where(:id => 3).first
new_in_tag.taggings_count = 0
new_in_tag.save
new_in_projects = Project.active.order("id DESC").first(20)
new_in_projects.each do |project|
  project.tag_list.add("new-in")
  project.save
end

puts "New-In Tags Updated!"
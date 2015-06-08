class BlogPost < ActiveRecord::Base
  attr_accessible :image, :summary, :title, :url, :guid

  def self.update_entries
    feed = Feedjira::Feed.fetch_and_parse('http://blog.qreoh.com/feed/')
    feed.entries.sort_by(&:published).each do |entry|
      unless exists? :guid => entry.id
        create!(
          :title => entry.title,
          :image => Nokogiri::HTML(entry.summary).xpath('//img/@src').to_s.gsub('http:', ''),
          :summary => Nokogiri::HTML(entry.content).text.squish.gsub(/[[:space:]]/, ' ').strip.squeeze(' '),
          :url => entry.url,
          :guid => entry.id
        )
      end if feed.entries
    end
  end
end

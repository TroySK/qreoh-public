class TumblrPost < ActiveRecord::Base
  attr_accessible :image, :title, :url

  def self.sync
    self.delete_all
    feed = Feedjira::Feed.fetch_and_parse('http://picks.qreoh.com/rss')
    feed.entries.sort_by(&:published).each do |entry|
      create!(
        :title => Nokogiri::HTML(entry.title).text.squish.gsub(/[[:space:]]/, ' ').strip.squeeze(' ').truncate(200),
        :image => (Nokogiri::HTML(entry.summary).xpath('//img/@src')[1] || Nokogiri::HTML(entry.summary).xpath('//img/@src')).to_s.gsub('http:', '').gsub('_500.', '_100.').gsub('_400.', '_100.'),
        :url => entry.url
      )
    end if feed.entries
  end
end

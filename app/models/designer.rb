class Designer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_paranoid
  acts_as_followable

  attr_accessible :user_id, :name, :about, :website, :location, :avatar, :facebook, :pinterest, :behance, :linkedin, :slideshare, :twitter, :instagram, :status, :current_collection
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "/images/:style/missing.png"
  belongs_to :user
  has_many :projects
  has_many :project_photos
  has_many :designer_feedbacks
  #validates_presence_of :name, :about
  mount_uploader :avatar, DesignerAvatarUploader
  has_attachment :photo, accept: [:jpg, :jpeg, :png, :gif]
  has_attachment :cover_photo, accept: [:jpg, :jpeg, :png, :gif]
  before_validation :smart_add_url_protocol

  UNPUBLISHED = 0
  ACTIVE = 1
  HIDDEN = 2

  scope :active, where(:status => ACTIVE)

  def to_param
    "#{slug}"
  end

  def should_generate_new_friendly_id?
    new_record? and !self.name.blank?
  end

  def recommended_projects
    Project.active.sample(12)
  end

  def is_owner?(user)
    return true if user.is_admin?
    user.id == user_id
  end

  protected

  def smart_add_url_protocol
    unless self.website.blank? || self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//]
      self.website = "http://#{self.website}"
    end
    unless self.facebook.blank? || self.facebook[/\Ahttp:\/\//] || self.facebook[/\Ahttps:\/\//]
      self.facebook = "https://#{self.facebook}"
    end
    unless self.pinterest.blank? || self.pinterest[/\Ahttp:\/\//] || self.pinterest[/\Ahttps:\/\//]
      self.pinterest = "https://#{self.pinterest}"
    end
    unless self.behance.blank? || self.behance[/\Ahttp:\/\//] || self.behance[/\Ahttps:\/\//]
      self.behance = "http://#{self.behance}"
    end
    unless self.linkedin.blank? || self.linkedin[/\Ahttp:\/\//] || self.linkedin[/\Ahttps:\/\//]
      self.linkedin = "https://#{self.linkedin}"
    end
    unless self.slideshare.blank? || self.slideshare[/\Ahttp:\/\//] || self.slideshare[/\Ahttps:\/\//]
      self.slideshare = "http://#{self.slideshare}"
    end
    unless self.twitter.blank? || self.twitter[/\Ahttp:\/\//] || self.twitter[/\Ahttps:\/\//]
      self.twitter = "https://#{self.twitter}"
    end
    unless self.instagram.blank? || self.instagram[/\Ahttp:\/\//] || self.instagram[/\Ahttps:\/\//]
      self.instagram = "https://#{self.instagram}"
    end
  end
  
end

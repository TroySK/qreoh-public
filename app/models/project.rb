class Project < ActiveRecord::Base
  extend FriendlyId
  include AlgoliaSearch
  friendly_id :title, use: :slugged
  ActsAsTaggableOn.force_parameterize = true
  acts_as_taggable
  acts_as_paranoid
  letsrate_rateable "product"
  
  attr_accessible :about, :category_id, :challenges, :color, :code, :desc, :description, :designer_id, :end_date, :location, :material, :material_details, :base_price, :discounted_price, :on_sale, :production_time, :quantity, :size_text, :status, :title, :production_days, :duration, :start_date, :tags, :fethr_button, :mywindow_button, :ooak, :size_details_attributes, :taxonomy, :color_details_attributes, :inventories_attributes, :youtube_url, :tag_list
  belongs_to :designer
  has_many :project_photos
  has_many :project_updates
  has_many :favorites
  has_attachment  :selfie, accept: [:jpg, :jpeg, :png, :gif]
  has_attachments :photos, accept: [:jpg, :jpeg, :png, :gif]
  has_many :size_details
  has_many :inventories
  has_many :color_details
  accepts_nested_attributes_for :size_details, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :inventories, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :color_details, :reject_if => :all_blank, :allow_destroy => true
  validates :title, presence: true

  UNPUBLISHED = 0
  ACTIVE = 1
  HIDDEN = 2
  ARCHIVED = 3

  CATEGORIES = {
    'Women' => 1,
    'Men' => 2,
    'Accessories' => 3
  }

  TAXONOMIES = {
    'Top' => 101,
    'Bottoms' => 102,
    'Dress' => 103,
    'Skirts' => 104,
    'Sari' => 105,
    'Accessory' => 106
  }

  scope :active, where(:status => ACTIVE)
  scope :unpublished, where(:status => UNPUBLISHED)
  scope :archived, where(:status => ARCHIVED)

  def to_param
    "#{slug}"
  end
  
  def total_stock
    inventories.blank? ? quantity.to_i : inventories.map{ |i| i.total.to_i }.inject(0,:+)
  end

  def current_stock
    inventories.blank? ? (quantity.to_i - orders.count) : inventories.map{ |i| i.total.to_i }.inject(0,:+) - inventories.map{ |i| i.sold.to_i }.inject(0,:+)
  end

  def current_preorders
    orders.count
  end

  def paypal_link
    values = { 
    :business => PAYPAL[Rails.env]['email'],
    :cmd => '_cart',
    :upload => 1,
    :return => PAYPAL[Rails.env]['return_url'] + "?paypal=true&checksum=#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('md5'), PAYPAL[Rails.env]['secret'], id.to_s)}",
    "amount_1" => (price/PAYPAL[Rails.env]['exchange_rate']).ceil + 25,
    "item_name_1" => title,
    "item_number_1" => id,
    "quantity_1" => '1'
    }
    "#{PAYPAL[Rails.env]['url']}" + values.to_query
  end

  def completion_percentage
    ooak ? 100 : 100 * current_preorders.to_i / (quantity || 1)
  end

  def og_description
    description.to_s.strip.blank? ? (desc.to_s.strip.blank? ? title : desc.to_s.squish) : description.to_s.squish
  end

  def orders
    shopping_cart_ids = ShoppingCartItem.where(:item_id => id).collect(&:owner_id)
    shopping_carts = ShoppingCart.where({:id => shopping_cart_ids, :status => false})
    orders = shopping_carts.collect(&:order)
    orders || []
  end

  def ooak?
    ooak
  end

  def active?
    status == ACTIVE
  end

  def unpublished?
    status == UNPUBLISHED
  end

  def can_edit?(user)
    return true if user.is_admin?
    designer.user_id == user.id and unpublished?
  end

  def is_owner?(user)
    designer.user_id == user.id
  end

  def preorder_ending_date
    start_date ? start_date.to_date + (duration ? duration : 30) : Date.today + (duration ? duration : 30)
  end

  def remaining_days
    return 0 if status == ARCHIVED
    return 1 if ooak?
    return 30 if duration.blank?
    return [1, (preorder_ending_date - Date.today).to_i].max
  end

  def shipping_date
    (ooak ? Date.today : preorder_ending_date) + (production_days ? production_days : 10).days
  end

  def related_projects
    designer.projects.active.sample(12)
  end

  def designer_name
    designer.name
  end

  def sizes
    inventories.blank? ? ["Free Size"] : inventories.collect do |i| i.size if (i.total.to_i - i.sold.to_i) > 0 end
  end

  def url
    Rails.application.routes.url_helpers.designer_project_url(self.designer, self)
  end

  def price
    on_sale? ? discounted_price : base_price
  end

  def on_sale?
    on_sale
  end

  def sold_out?
    total_stock <= 0
  end

  algoliasearch if: :active? do
    attribute :title, :designer_name, :price, :code, :desc, :description, :sizes, :material, :material_details, :color_details, :url, :tag_list
  end

end

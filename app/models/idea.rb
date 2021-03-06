class Idea < ActiveRecord::Base
  attr_accessible :content, :image, :tag_list, :tags, :supplemental, :supplemental_id
  
  belongs_to :citizen

  has_many :taggings
  has_many :tags, through: :taggings
  has_many :supplementals
  has_many :images, through: :supplementals

  mount_uploader :image, SupplementalUploader

  validates :content, presence: true, length: { maximum: 137337 }
  validates :citizen_id, presence: true

  default_scope order: 'ideas.created_at DESC'

  def feed
    Idea.all
  end

  def self.from_citizens_followed_by(citizen)
    followed_citizen_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :citizen_id"
    where("citizen_id IN (#{followed_citizen_ids}) OR citizen_id = :citizen_id",
          citizen_id: citizen.id)
  end

#
# tagging functionality
#

  def self.tagged_with(name)
    Tag.find_by_name!(name).ideas
  end

  def self.tag_counts
  Tag.select("tags.id, tags.name,count(taggings.tag_id) as count").
    joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end  
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end

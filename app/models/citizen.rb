class Citizen < ActiveRecord::Base
  attr_accessible :name, :email, :about, :telephone, :notes, :password, :password_confirmation, :parcels_attributes, :can_add_company, :can_add_parcel

  has_secure_password
  has_many :ideas, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_citizens, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :parcels
  has_many :companies
  
  accepts_nested_attributes_for :parcels
  
  before_save { |citizen| citizen.email = email.downcase }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 59 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def feed
    Idea.find_all_citizens
  end

  def personal_feed
    Idea.from_citizens_followed_by(self)
  end


  def following?(other_citizen)
    relationships.find_by_followed_id(other_citizen.id)
  end

  def follow!(other_citizen)
    relationships.create!(followed_id: other_citizen.id)
  end

  def unfollow!(other_citizen)
    relationships.find_by_followed_id(other_citizen.id).destroy
  end


  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

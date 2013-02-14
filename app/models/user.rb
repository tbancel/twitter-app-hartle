# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  has_many :microposts, dependent: :destroy
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: "followed"
  #the source name is followed because the attributes is followed_id in the
  #relationships model (table)
  
  has_many :reverse_relationships, foreign_key: "followed_id",
    class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: "follower"
  #source "follower" is not necessary here because by default Rails will look for the singular version of 
  #:followers in the relationships table, ie "follower" therefore "follower_id" column
  
  before_save {|user| user.email = email.downcase}
  before_save :create_remember_token
  
  
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, 
    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}
  validates :password_confirmation, presence: true

  def feed
   #This is preliminary. See "Following users" for the full implementation.
   Micropost.from_users_followed_by(self)
   #microposts
  end
  
  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end
  
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def self.find_or_create_with_ebay(omniauth_hash)
    name = omniauth_hash['info']['full_name']
    email = omniauth_hash['info']['email']
    uuid = omniauth_hash['uid']

    user = User.find_by_email(email)
    return user unless user.nil?

    user = User.create! do |user|
      user.name = name
      user.email = email
      user.password = uuid
      user.password_confirmation = uuid
    end
    user
  end
  
  private
  def create_remember_token
    self.remember_token=SecureRandom.urlsafe_base64
  end

end

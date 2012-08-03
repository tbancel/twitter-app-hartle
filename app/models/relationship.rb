class Relationship < ActiveRecord::Base
  attr_accessible :followed_id
  
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  #this class belongs to 2 users, the followed (source: followed_id ie "followed") 
  #and the follower (source: follower_id ie "follower")
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end

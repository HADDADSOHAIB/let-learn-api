class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'The email is not valid' } 
  validates :username, :firstname, :lastname, :email, presence: true
  validates :username, length: { maximum: 20 }, uniqueness: { case_sensitive: false }

  has_many :relation_followers, foreign_key: :followed_id, class_name: 'Following'
  has_many :followers, through: :relation_followers

  has_many :relation_followeds, foreign_key: :follower_id, class_name: 'Following'
  has_many :followeds, through: :relation_followeds

end

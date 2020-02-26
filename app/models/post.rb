class Post < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  def self.search(search)
    return Post.all unless search
    Post.where('content LIKE(?)', "%#{search}%")
  end

end

class Post < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes


  def self.search(search)
    return Post.all unless search
    Post.where('content LIKE(?)', "%#{search}%")
  end

  # def liked? (like_user_id, like_post_id)
  #   likes.where(user_id: like_user_id, post_id: like_post_id).exists?
  #  end

end

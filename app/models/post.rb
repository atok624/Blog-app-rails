class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: :User
  has_many :comments, foreign_key: :post_id, class_name: :Comment
  has_many :likes, dependent: :destroy, foreign_key: :post_id, class_name: :Like

  after_create :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }

  def top_5_comments
    comments.includes(:author).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe '#top_5_comments' do
    let(:post) { create(:post) } # Assuming you have a factory set up for Post

    it 'returns the 5 most recent comments for the post' do
      create_list(:comment, 10, post: post)

      expect(post.top_5_comments.count).to eq(5)
      expect(post.top_5_comments.first.created_at).to be > post.top_5_comments.last.created_at
    end
  end

  describe '#update_posts_counter' do
    let(:post) { create(:post) } # Assuming you have a factory set up for Post
    let(:author) { create(:user) } # Assuming you have a factory set up for User

    it 'increments the posts_counter of the associated author' do
      post.author = author
      expect { post.update_posts_counter }.to change { author.posts_counter }.by(1)
    end
  end
end

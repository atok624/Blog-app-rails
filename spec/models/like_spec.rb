require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_likes_counter' do
    let(:post) { create(:post) } # Assuming you have a factory set up for Post
    let(:author) { create(:user) } # Assuming you have a factory set up for User

    it 'increments the likes_counter of the associated post' do
      like = create(:like, post: post, author: author)

      expect { like.update_likes_counter }.to change { post.likes_counter }.by(1)
    end
  end
end

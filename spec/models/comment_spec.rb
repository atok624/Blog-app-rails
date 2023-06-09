require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comment_counter' do
    let(:post) { create(:post) } # Assuming you have a factory set up for Post
    let(:author) { create(:user) } # Assuming you have a factory set up for User

    it 'increments the comments_counter of the associated post' do
      comment = create(:comment, post: post, author: author)

      expect { comment.update_comment_counter }.to change { post.comments_counter }.by(1)
    end
  end
end

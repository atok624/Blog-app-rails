require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:bio) }
    it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe '#best_three_posts' do
    let(:user) { create(:user) } # Assuming you have a factory set up for User

    it 'returns the 3 most recent posts for the user' do
      create_list(:post, 5, author: user)

      expect(user.best_three_posts.count).to eq(3)
      expect(user.best_three_posts.first.created_at).to be > user.best_three_posts.last.created_at
    end
  end
end

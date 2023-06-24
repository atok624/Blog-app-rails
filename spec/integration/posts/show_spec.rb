require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Post index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post, author: user) }
  let!(:comment1) { FactoryBot.create(:comment, post:) }
  let!(:comment2) { FactoryBot.create(:comment, post:) }
  let!(:like) { FactoryBot.create(:like, post:) }

  before do
    visit user_posts_path(user)
  end

  it "displays the post's title" do
    expect(page).to have_content(post.title)
  end

  it "displays the post's author" do
    expect(page).to have_content(user.name)
  end

  it 'displays the number of comments the post has' do
    expect(page).to have_content("Comments: #{post.comments.count}")
  end

  it 'displays the number of likes the post has' do
    expect(page).to have_content("likes: #{post.likes.count}")
  end

  it "displays the post's body" do
    expect(page).to have_content(post.text)
  end

  it 'displays the username of each commentor' do
    expect(page).to have_content(comment1.author.name)
    expect(page).to have_content(comment2.author.name)
  end

  it 'displays the comment each commentor left' do
    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
  end
end

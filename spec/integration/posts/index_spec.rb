require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'
RSpec.feature 'User index page' do
  let(:user) { FactoryBot.create(:user) }
  let(:postClick) { FactoryBot.create(:post, text: 'Click me', title: 'First post', author: user) }
  let!(:posts) { FactoryBot.create_list(:post, 1, author: user) }
  it 'displays the correct information' do
    visit user_posts_path(user)
    # expect(page).to have_css("img[src='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.count}")
    expect(page).to have_content(posts[0].text)
    expect(page).to have_content("Comments: #{posts[0].comments.count}")
    expect(page).to have_content("likes: #{posts[0].likes.count}")
    expect(page).to have_css('.button', text: 'Pagination')
    click_link(posts[0].text, wait: 10)
    expect(current_path).to eq(user_post_path(user, posts[0]))
  end
end

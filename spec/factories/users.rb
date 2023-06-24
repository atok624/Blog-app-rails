FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    photo { 'www.unsplash.com/user/1' }
    bio { 'This is my bio' }
    posts_counter { 0 }
  end
end

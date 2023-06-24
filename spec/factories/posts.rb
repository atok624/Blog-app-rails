FactoryBot.define do
  factory :post do
    title { 'My Post' }
    text { 'This is my post.' }
    association :author, factory: :user
    comments_counter { 0 }
    likes_counter { 0 }
  end
end

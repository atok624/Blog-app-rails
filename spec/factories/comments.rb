FactoryBot.define do
  factory :comment do
    text { 'This is my comment.' }
    association :author, factory: :user
    association :post, factory: :post
  end
end


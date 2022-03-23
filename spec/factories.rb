FactoryBot.define do
  factory :post_reaction do
    post { nil }
    user { nil }
    reaction { nil }
  end

  factory :reaction do
    title { "MyString" }
  end

  factory :post_tag do
    post { nil }
    tag { nil }
  end

  factory :tag do
    title { "MyString" }
  end

  factory :random_user, class: User do
    email { Faker::Internet.email }
    password { "password" }
  end

  factory :random_post, class: Post do
    description { Faker::Lorem.paragraph }
    user { FactoryBot.create(:random_user) }
  end
end

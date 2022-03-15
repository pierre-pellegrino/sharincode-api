FactoryBot.define do
  factory :random_user, class: User do
    email { Faker::Internet.email }
    password { "password" }
  end

  factory :random_post, class: Post do
    description { Faker::Lorem.paragraph }
    user { FactoryBot.create(:random_user) }
  end
end

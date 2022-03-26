FactoryBot.define do

  factory :user, class: User do
    email { "rspec_tests@yopmail.com" }
    password { "password" }
    username { "rspec_test" }
  end

  factory :random_user, class: User do
    email { Faker::Internet.email }
    password { 'password' }
    username { "base #{Faker::Lorem.word}" }
  end

  factory :post, class: Post do
    description { Faker::Lorem.paragraph }
    user { FactoryBot.create(:random_user) }
  end

  factory :comments, class: Comment do
    text { Faker::Lorem.paragraph }
    post { FactoryBot.create(:post) }
    user { FactoryBot.create(:user) }
  end

end

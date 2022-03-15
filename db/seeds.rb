User.destroy_all

def loading_bar(i, total, action)
  count = i * 50 / total
  system('clear')
  puts action
  puts "#{i * 100 / total}% [#{'#' * count}#{' ' * (50 - count)}]"
end

loading_bar(1, 4, 'creating users')
user1 = User.create(
  email: 'b@yopmail.com',
  password: "password",
)
# user1.avatar.attach(
#   io: File.open(Rails.root.join('app', 'assets', "avatar1.jpg")),
#   filename: 'avatar.jpg'
# )

loading_bar(2, 4, 'creating users')
user2 = User.create(
  email: 'p@yopmail.com',
  password: "password",
)
# user2.avatar.attach(
#   io: File.open(Rails.root.join('app', 'assets', "avatar2.jpg")),
#   filename: 'avatar.jpg'
# )

loading_bar(3, 4, 'creating users')
user3 = User.create(
  email: 't@yopmail.com',
  password: "password",
)
# user3.avatar.attach(
#   io: File.open(Rails.root.join('app', 'assets', "avatar3.jpg")),
#   filename: 'avatar.jpg'
# )

loading_bar(4, 4, 'creating users')
user4 = User.create(
  email: 'a@yopmail.com',
  password: "password",
)
# user4.avatar.attach(
#   io: File.open(Rails.root.join('app', 'assets', "avatar4.jpg")),
#   filename: 'avatar.jpg'
# )
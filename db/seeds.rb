def loading_bar(i, total, action)
  count = i * 50 / total
  system('clear')
  puts action
  puts "#{i * 100 / total}% [#{'#' * count}#{' ' * (50 - count)}]"
end

loading_bar(1, 5, 'cleaning db')
User.destroy_all
loading_bar(2, 5, 'cleaning db')
Post.destroy_all
loading_bar(3, 5, 'cleaning db')
Snippet.destroy_all
loading_bar(4, 5, 'cleaning db')
Comment.destroy_all
loading_bar(5, 5, 'cleaning db')
Tag.destroy_all


loading_bar(1, 4, 'creating users')
user1 = User.create(
  email: 'b@yopmail.com',
  password: "password",
  username: "Bobo L'Asticot",
  description: "Ceci est ma description",
  github_url: "https://github.com/Beygs",
  personal_url: "portfolio",
  favorite_theme: "darkTheme"
)
user1.avatar.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', "avatar1.jpg")),
  filename: 'avatar.jpg'
)

loading_bar(2, 4, 'creating users')
user2 = User.create(
  email: 'p@yopmail.com',
  password: "password",
  username: "The Front Maniac",
  description: "Ceci est ma description",
  github_url: "https://github.com/pierre-pellegrino",
  personal_url: "portfolio",
  favorite_theme: "darkTheme"
)
user2.avatar.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', "avatar2.jpg")),
  filename: 'avatar.jpg'
)

loading_bar(3, 4, 'creating users')
user3 = User.create(
  email: 't@yopmail.com',
  password: "password",
  username: "The Awakening Sleeper",
  description: "Ceci est ma description",
  github_url: "https://github.com/TimotheeGimbert",
  personal_url: "portfolio",
  favorite_theme: "darkTheme"
)
user3.avatar.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', "avatar3.jpg")),
  filename: 'avatar.jpg'
)

loading_bar(4, 4, 'creating users')
user4 = User.create(
  email: 'a@yopmail.com',
  password: "password",
  username: "The Back Maniac",
  username: "The Awakening Sleeper",
  description: "Ceci est ma description",
  github_url: "https://github.com/talmidiel",
  personal_url: "portfolio",
  favorite_theme: "darkTheme"
)
user4.avatar.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', "avatar4.jpg")),
  filename: 'avatar.jpg'
)

30.times do |i|
  loading_bar(i + 1, 30, 'creating posts')
  post = Post.create(
    user: User.all[rand(User.all.length)],
    description: "Calculates the average of an array, after mapping each element to a value using the provided function.

    Use Array.prototype.map() to map each element to the value returned by fn.
    Use Array.prototype.reduce() to add each value to an accumulator, initialized with a value of 0.
    Divide the resulting array by its length.",
    )
end

languages = %w[
  Bash
  CSS
]

100.times do |i|
  loading_bar(i + 1, 100, 'creating snippets')
  Snippet.create(
    content: "const averageBy = (arr, fn) =>
    arr
      .map(typeof fn === 'function' ? fn : val => val[fn])
      .reduce((acc, val) => acc + val, 0) / arr.length;

    averageBy([{ n: 4 }, { n: 2 }, { n: 8 }, { n: 6 }], o => o.n); // 5
    averageBy([{ n: 4 }, { n: 2 }, { n: 8 }, { n: 6 }], 'n'); // 5",
    post: Post.all[rand(Post.all.length)],
    language: languages.sample(1)
  )
end

100.times do |i|
  loading_bar(i + 1, 100, 'creating comments')
  Comment.create(
    content: Faker::Lorem.paragraph,
    user: User.all[rand(User.all.length)],
    post: Post.all[rand(Post.all.length)]
  )
end

tags = %W[
  Web
  FrontEnd
  BackEnd
  Database
  Components
  Design
  Efficiency
  Scalability
  Deploy
  Testing
]

tags.each do |tag|
  myTag = Tag.create(title: tag)
  puts 'New Tag: ' + myTag.title
  3.times do 
    myPost = Post.all[rand(Post.all.length)]
    PostTag.create(post: myPost, tag: myTag)
    puts 'PostTag relation created between the post ' + myPost.id.to_s + ' and the tag ' + myTag.title
  end
end

User.create(email: 'anthony@exemple.com', password: 'password')

30.times do
  Post.create(
    user: User.first,
    description: 'HTML Pro Tip 💡

Use "translate" attribute and set it value to "no" for your company name.

So that in case, the webpage is translated into another language, your brand name will remain intact.'
  )
end

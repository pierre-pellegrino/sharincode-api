module AuthorizationHelper
  def sign_up(user)
    post '/users',
         params: {
           user: {
             email: user[:email],
             password: user[:password]
           }
         },
         as: :json
    response.headers.slice('Authorization')
  end

  def user_jwt(user)
    post '/users/sign_in/',
         params: {
           user: {
             email: user[:email],
             password: user[:password]
           }
         },
         as: :json
    response.headers.slice('Authorization')
  end
end


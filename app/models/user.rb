class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_many :posts, dependent: :destroy
  has_many :snippets, through: :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  validates :username,
  uniqueness: true,
  length: { 
    minimum: 4,
    maximum: 36 
  }

  after_create :welcome_send


  def self.from_github(data)
    where(uid: data['email']).first_or_initialize.tap do |user|
      user.provider = 'github'
      user.uid = data['email']
      user.email = data['email']
      user.password = Devise.friendly_token[0, 20]
      user.save!
    end
  end

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end

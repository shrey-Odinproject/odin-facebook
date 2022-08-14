class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github google_oauth2]

  has_many :requests, dependent: :destroy
  has_many :pending_requests, -> { where accepted: false }, class_name: 'Request', foreign_key: 'friend_id'

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one :profile, dependent: :destroy

  def friends
    friends_i_sent_request = Request.where(user_id: id, accepted: true).pluck(:friend_id)
    friends_i_got_request = Request.where(friend_id: id, accepted: true).pluck(:user_id)
    all_friend_ids = friends_i_sent_request + friends_i_got_request
    User.where(id: all_friend_ids)
  end

  def friend_with?(user)
    Request.accepted_record?(id, user.id)
  end

  def send_request(user)
    Request.create(friend_id: user.id)
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end

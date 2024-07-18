class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

    has_many :twitter_accounts
    has_many :tweets
    has_secure_password

    validates :email, presence: true

    generates_token_for :password_reset, expires_in: 15.minutes do
      password_salt&.last(10)
    end
end

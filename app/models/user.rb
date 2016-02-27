class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

  has_many :projects, dependent: :destroy

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end

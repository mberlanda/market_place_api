class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_validation :generate_authentication_token!, on: :create
  validates :auth_token, uniqueness: true
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy

  def generate_authentication_token!
    self.auth_token = loop do
      token = Devise.friendly_token
      break token unless User.exists?(auth_token: token)
    end
  end

end

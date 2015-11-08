class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence:true, uniqueness:true
  validates :email, presence:true

  has_many :kata,  through: :socials 
  has_many :socials, dependent: :destroy

  def generate_password_reset_token!
   update(password_reset_token: SecureRandom.urlsafe_base64(48))
 end
end

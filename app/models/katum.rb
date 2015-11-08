class Katum < ActiveRecord::Base
  has_many :users,  through: :socials 
  has_many :socials, dependent: :destroy
end

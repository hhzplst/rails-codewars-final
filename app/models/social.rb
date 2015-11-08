class Social < ActiveRecord::Base
  belongs_to :user
  belongs_to :katum
end

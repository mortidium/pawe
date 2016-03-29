class Tag < ActiveRecord::Base
  has_many :parts, :dependent => :destroy
  has_many :posts, through: :parts
end

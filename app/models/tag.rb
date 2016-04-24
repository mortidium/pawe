class Tag < ActiveRecord::Base
  has_many :parts, :dependent => :destroy
  has_many :posts, through: :parts
    has_many :liketags, :dependent => :destroy
end

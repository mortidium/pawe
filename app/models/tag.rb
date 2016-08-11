class Tag < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  has_many :liketags, :dependent => :destroy
end

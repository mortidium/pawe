class Part < ActiveRecord::Base
  belongs_to :tag
  belongs_to :post
 validates :post, uniqueness: {scope: :tag}
    validates :tag, uniqueness: {scope: :post}
end

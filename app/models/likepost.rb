class Likepost < ActiveRecord::Base
    belongs_to :tag
    validates :post, uniqueness: {scope: :id}
end

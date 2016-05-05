class Likepost < ActiveRecord::Base
    belongs_to :post
    validates :ip, uniqueness: {scope: :post_id}, presence: true
end

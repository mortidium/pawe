class Liketag < ActiveRecord::Base
    belongs_to :tag
    validates :ip, uniqueness: {scope: :tag_id}, presence: true
end

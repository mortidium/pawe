class Liketag < ActiveRecord::Base
    belongs_to :tag
 validates :tag, uniqueness: {scope: :ip}
end

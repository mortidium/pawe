class Post < ActiveRecord::Base
  has_attached_file :image, default_url: "http://41.media.tumblr.com/573443f1697fde0832eeecd5f4996e40/tumblr_o3zphg6cy31symt9go1_500.jpg"
  validates :title, presence: true,
            length: { minimum: 5 }
  validates_attachment :image,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end

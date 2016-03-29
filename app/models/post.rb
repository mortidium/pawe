class Post < ActiveRecord::Base
  has_many :parts
    has_many :tags, through: :parts
    
    def self.tagged_with(title)
        Tag.find_by_name!(title).posts
  end
    
  def self.tag_counts
    Tag.select("tags.*, count(parts.tag_id) as count").
      joins(:parts).group("parts.tag_id")
  end
  
  def tag_list
      tags.map(&:title).join(", ")
  end
  
    def tag_list=(titles)
        self.tags = titles.split(",").map do |n|
            Tag.where(title: n.strip).first_or_create!
    end
  end
    
  has_attached_file :image, default_url: "http://41.media.tumblr.com/573443f1697fde0832eeecd5f4996e40/tumblr_o3zphg6cy31symt9go1_500.jpg"
  validates :title, presence: true,
            length: { minimum: 5 }
  validates_attachment :image,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end

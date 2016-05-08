module LikepostHelper
    def ip_voted_for_post? (post) 
        Likepost.where(post_id: post.id, ip: request.remote_ip).exists?      
    end
    
    def count_likeposts (post)
        Likepost.count(post_id: post.id)
    end
    
end

module LikepostHelper
    def ip_voted_for? (post) 
        Likepost.where(post_id: post.id, ip: request.remote_ip).exists?      
    end
    
end

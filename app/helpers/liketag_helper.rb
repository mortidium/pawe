module LiketagHelper
        def ip_voted_for_tag? (tag) 
        Liketag.where(tag_id: tag.id, ip: request.remote_ip).exists?      
    end
    
     def count_liketags (tag)
         Liketag.where(tag_id: tag.id).count
    end
end

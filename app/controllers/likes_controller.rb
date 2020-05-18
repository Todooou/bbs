class LikesController < ApplicationController 
    
    def create
        @post = Post.find(params[:post_id])
        @alreadylike = Like.find_by(ip: request.remote_ip, post_id: params[:post_id])
        if @alreadylike
            redirect_back(fallback_location: root_path)
            flash[:notice] = "すでにいいねしています"
        else
            @like = Like.create(post_id: params[:post_id], ip: request.remote_ip)
            redirect_back(fallback_location: root_path)
        end
    end


end

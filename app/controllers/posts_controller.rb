class PostsController < ApplicationController
  before_action :authenticate_user!,except:[:index]
    def new
        @post = Post.new
    end
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to action: "index"        
        else
            redirect_to action: "new"
        end
    end

    def index
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
      
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to action: "new", :id =>@post.id
        else
            redirect_to action: "new"
        end
    end

    def destroy
        # Post.find(params[:id]).destroy
        # redirect_to action: "new"
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to action: "new"
        else
            render:edit
        end 
    end

    private
        def post_params
            params.require(:post).permit(:body,:picture,:who,:url,:title) 
        end
end
class CommentsController < ApplicationController
    def new
        @comment = Comment.new
        @post = Post.find_by(id: params[:post_id])
    end
    
    def create
        #@post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to :root
        else
            render action: :new
        end
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
        @post = Post.find_by(id: params[:post_id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        if @comment.update_attributes(comment_params)
            redirect_to :root
        else
            redirect_to action: :edit
        end
    end

    def show
        @comment = Comment.find_by(id: params[:id])
    end


    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            redirect_to :root
        else
            render:edit
        end
    end

 private
    def comment_params
        params.require(:comment).permit(:content, :post_id, :user_id)
    end
end


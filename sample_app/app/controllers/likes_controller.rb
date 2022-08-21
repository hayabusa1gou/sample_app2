class LikesController < ApplicationController

    def likes_create
        @post=Post.find_by(id:params[:id])
        @like=Like.new(user_id:@current_user.id,post_id:params[:id])
        @like.save
        redirect_to("/posts/index")
    end

    def likes_destroy
        @post=Post.find_by(id:params[:id])
        @like=Like.find_by(user_id:@current_user.id,post_id:params[:id])
        @like.destroy
        redirect_to("/posts/index")

    end



end
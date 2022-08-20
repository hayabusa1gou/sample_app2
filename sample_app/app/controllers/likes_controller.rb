class LikesController < ApplicationController

    def likes_create
        @post=Post.find_by(id:params[:id])
        @like=Review.new(user_id:@current_user.id,post_id:params[:id])
        @like.save
        redirect_to("/posts/#{@post.id}")
    end

    def likes_destroy
        @post=Post.find_by(id:params[:id])
        @like=Review.find_by(user_id:@current_user.id,post_id:params[:id])
        @like.destroy
        redirect_to("/posts/#{@post.id}")

    end



end
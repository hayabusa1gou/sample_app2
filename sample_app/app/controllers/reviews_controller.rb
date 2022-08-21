class ReviewsController < ApplicationController

    before_action :ensure_user ,{only: [:reviews_destroy]}

    def reviews_create
        @post=Post.find_by(id:params[:id])
        @review=Review.new(user_id:@current_user.id,post_id:@post.id,content:params[:content])
        @review.save
        redirect_to("/posts/#{@post.id}")
    end

    def reviews_destroy
        @post=Post.find_by(id:params[:id])
        @review=Review.find_by(user_id:@current_user.id,post_id:params[:id])
        @review.destroy
        redirect_to("/posts/#{@post.id}")

    end

    def ensure_user

        if @current_user.id!=nil
        
            @review=Review.find_by(user_id:@current_user.id)
            if @review.user_id!=@current_user.id
                redirect_to("/posts/index")
            end
        else
            redirect_to("/post/index")

        end
    
    end
    

end
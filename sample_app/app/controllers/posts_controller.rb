class PostsController < ApplicationController
  before_action :authenticate_user,{only: [:new,:create,:edit,:update,:destroy,:likes,:reviews]}
  before_action :ensure_user,{only: [:edit,:update,:destroy]}


  def index
    @posts=Post.all

  end


  def new
    @post=Post.new()
   
  end
  

  def create
    
    @post=Post.new(
      post_image1:params[:post_image1],
      post_image2:params[:post_image2],
      post_image3:params[:post_image3],
      title:params[:title],
      content:params[:content], 
      user_id:@current_user.id
      )
    @post.save

    if params[:post_image1]

      @post.post_image1="#{@post.id}.png"
      image1 = params[:post_image1]
      File.binwrite("public/user_images/#{@post.post_image1}", image1.read)
    end

    if params[:post_image2]

      @post.post_image2="#{@post.id}.png"
      image2 = params[:post_image2]
      File.binwrite("public/user_images/#{@post.post_image2}", image2.read)

    end

    if params[:post_image3]
      @post.post_image3="#{@post.id}.png"
      image3 = params[:post_image3]
      File.binwrite("public/user_images/#{@post.post_image3}", image3.read)
  
      
    end



    if @post.save
      redirect_to("/posts/index")

    else
      render("posts/new")
    end
  end

  def show
    @post=Post.find_by(id:params[:id])
    @reviews=Review.all
    @likes_count = Like.where(post_id: @post.id).count

  end

  def edit
    @post=Post.find_by(id:params[:id])

  end

  def update
    redirect_to("/users/#{@current_user.id}")
  end



  def destroy
    @post=Post.find_by(id:params[:id])
    @post.destroy
    redirect_to("/users/#{@current_user.id}")
  end

  def ensure_user
    @post=Post.find_by(id:params[:id])
    if @post.user_id!=@current_user.id
        redirect_to("/posts/index")
    end
  end

  

  def likes


  end

  def reviews


  end
end

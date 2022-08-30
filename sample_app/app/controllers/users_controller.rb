class UsersController < ApplicationController

  before_action :authenticate_user,{only: [:show]}
  before_action :ensure_user,{only: [:edit,:update]}
  before_action :forbit_login_user,{only: [:new, :create, :login_form, :login]}

  def new
    @user=User.new()
  end

  def create
    @user = User.new(
            name:params[:name],
            email:params[:email],
            password:params[:password],
            user_image:"icons8-ユーザー-50.png"
            )
    @user.save

    if @user.save
      session[:user_id]=@user.id
      redirect_to("/posts/index")
    else
      render("users/new")
    end

  end

  def show
    @user=User.find_by(id:params[:id])
    @posts=Post.where(user_id:@current_user.id)
  end

  def edit
  end

  def login_form
  end

  def login
    @user=User.find_by(email:params[:email],password:params[:password])
    if @user
      session[:user_id]=@user.id
      redirect_to("/posts/index")
    else
      redirect_to("/users/login_form")
    end
  end

  def logout
    session[:user_id]=nil
    @current_user=nil
    redirect_to("/posts/index")
  end

  def ensure_user
    if @current_user.id!=params[:id].to_i
      redirect_to("/posts/index")
    end

  end


  
end

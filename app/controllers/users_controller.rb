class UsersController < ApplicationController

  before_action :authenticated!, :set_user, :authorized!, except: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = current_user #assumes render :show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil
      redirect_to new_user_path
    else
      render :edit
    end
  end

  def viewposts
    @posts = Post.all
    @posts = @posts.map do |post|
      friendship = Friendship.find(post.friendship_id)
      return_variable = [User.find(friendship.user_id).name, post]
      return_variable
    end

    #binding.pry
    @posts = @posts.select do |name_post|
      friendship = Friendship.find(name_post[1].friendship_id)
      return (current_user.id == friendship.friend_id)
    end

    render :viewposts
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorized!
    unless @user.id == session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end
end
class PostsController < ApplicationController
  def index
    @posts = Post.all(:order => "created_at DESC")
  end
 
  def create
    @post = Post.create(message: post_params[:message], friendship_id: params[:friendship_id])
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_path(params[:user_id]) }
        format.js
      else
        flash[:notice] = "Message failed to save."
        format.html { redirect_to root_path }
      end
    end
  end

  def show
    render :show
  end

  def new 
    @post = Post.new

    render :new
  end
    
  private

  def post_params
    params.require(:post).permit(:message )
  end

end
class PostsController < ApplicationController
before_action :authenticate_user,{only:[:new]}
before_action :ensure_correct_user,{only:[:edit,:update,:destroy]}


  def index
  @posts = Post.all.order(create_at: :desc)
  @user = User.all
  end

  def show
  @post = Post.find_by(id: params[:id])
  @user = User.find_by(id: @post.user_id)
  end

  def new
  @post = Post.new
  @users = User.all
  end

  def create
   @post = Post.new(content: params[:content],
                    user_id: @current_user.id)
   @post.save
   redirect_to("/posts/index")
end

def edit
@post = Post.find_by(id: params[:id])
end

def update
@post = Post.find_by(id: params[:id])
@post.content = params[:content]
@post.save
redirect_to("/posts/index")
end

def destroy
@post = Post.find_by(id: params[:id])
@post.destroy
redirect_to("/posts/index")
end

def ensure_correct_user
  @post = Post.find_by(id: params[:id])
  if @post.user_id != @current_user.id
   flash[:notice] = "権限がありません"
   redirect_to("/posts/index")
  end
end

end
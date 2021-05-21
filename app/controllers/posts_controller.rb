# ここはルートパスの投稿を管理するコントローラー

class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.includes(:user)
    @user = User.all
  end

  def new
    @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      if @post.valid?
         @post.save
          return redirect_to root_path
      else
         render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:month, :day, :access, :post).merge(user_id: current_user.id)
  end

end

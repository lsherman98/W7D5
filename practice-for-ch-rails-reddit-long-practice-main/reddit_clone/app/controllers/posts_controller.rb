class PostsController < ApplicationController
  before_action :require_author, only: [:edit, :update]

  def require_author
    @post = Post.find(params[:id])
    redirect_to post_url(@post) unless current_user == @post.author
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    @post.user_id = params[:user_id]

    if @post.save
      redirect_to post_url(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end

end

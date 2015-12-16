class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post.destroy
    redirect_to @post
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :pull_quote)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

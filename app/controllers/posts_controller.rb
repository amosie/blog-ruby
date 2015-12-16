class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
    # any @var is handed to the view which is siltently rendered.
    # render :index happens behind the scenes
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash_success("created")
    else
      flash_error(:new)
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash_success("updated")
    else
      flash_error(:edit)
    end
  end

  def destroy
    @post.destroy
    redirect_to @post
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :pull_quote, :author_name)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def flash_success(action)
    flash[:sucess] = "Successfully #{action} post"
    redirect_to @post
  end

  def flash_error(template)
    flash[:error] = "Something went wrong, please check the form and try again."
    render template
  end
end

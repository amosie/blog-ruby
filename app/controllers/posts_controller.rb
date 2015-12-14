class PostsController < ApplicationController
  def index
    @posts = [
       {
         :title => "Hello world",
         :body => "My first blog post"
         },

         {
         :title => "Learning ruby",
         :body => "My second blog post"
         },

         {
         :title => "Why I hate ruby",
         :body => "My third blog post"
         }
      ]
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

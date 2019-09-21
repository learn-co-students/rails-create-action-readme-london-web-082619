class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  # add create method here
  def create
    # @post = Post.create(post_params)
    # redirect_to post_path(@post)
    @post = Post.new
    @post.title = params[:title]
    @post.description = params[:description]
    @post.save
    redirect_to post_path(@post)

  end

  def destroy
    Post.destroy(params[:id])

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end

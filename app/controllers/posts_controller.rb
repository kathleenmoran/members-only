class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(allowed_post_params)
    @post.users_id = current_user.id
    if @post.save
      redirect_to new_post_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def allowed_post_params
    params.require(:post).permit(:title, :body)
  end
end

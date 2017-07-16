class PostsController < ApplicationController
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build post_params

    if @post.save
      flash[:success] = t ".micropost_created"
      redirect_to root_url
    else
      @feed_items = []
      render "static_pages/home"
    end
  end

  def destroy
    if @post.destroy
      render json: {status: :success}
    else
      render json: {status: :error, message: "Delete fails"}
    end
  end

  private

  def post_params
    params.require(:post).permit :content, :picture, :title
  end

  def correct_user
    @post = current_user.posts.find_by id: params[:id]
    redirect_to root_url if @post.nil?
  end
end

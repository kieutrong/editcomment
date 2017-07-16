class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
    @comments = @user.comments.paginate page: params[:page],
      per_page: Settings.user.users_per_page
  end

  def new
    @comment = Comment.new
  end

 def edit
    render json: {
      status: :success,
      html: render_to_string(partial: "comments/edit_form", locals: {comment: @comment}, layout: false)
    }
  end

  def update
    if @comment.update_attributes comment_params
      render json: {
        status: :success,
        html: render_to_string(partial: "comments/comment", locals: {comment: @comment}, layout: false)
      }
    else
      render json: {
        status: :error,
        message: "ERROR"
      }
    end
  end

  # def update
  #   byebug
  #   if @comment.update_attributes comment_params
  #     render json: {status: :success, html: render_to_string(@comment)}
  #   else
  #     render json: {status: :error}
  #   end
  # end

  def create
    @post = Post.find_by id:(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      render json: {status: :success, html: render_to_string(@comment)}
    else
      render json: {status: :error, errors: @comment.errors.messages}
    end
  end

  def destroy
    if @comment.destroy
      render json: {status: :success}
    else
      render json: {status: :error, message: "Delete fails"}
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end

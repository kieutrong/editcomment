class UsersController < ApplicationController
  before_action :load_user, only: :show

  def show
  end

  private

  def load_user
    @user = User.find_by id: params[:id]

    return if @user
      flash[:danger] = t(".not_find_user") << params[:id]
      redirect_to new_user_registration_path
  end
end

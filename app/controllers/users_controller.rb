class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  before_filter :authenticate_user!, onlu: [:edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def profile
    @user = current_user
    render 'show'
  end

  def edit
  end

  def update
    authorize_action_for @user
    # if current_user.has_role? :admin
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render 'edit'
      end
    # else
    #   render 'show'
    # end
  end

  protected

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:admin)
  end

end
class UsersController < ApplicationController
  before_action :authorize_admin, only: [:index, :create, :create, :destroy]
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all

    render json: { users: @users }
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def authorize_admin
    return if current_user.admin?
    render json: {
      error: "Only admins can do this action",
      status: 401
    }, status: 401
  end

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit!
  end
end

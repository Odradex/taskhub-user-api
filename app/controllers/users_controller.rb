class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :destroy]

  def index
    @users = User.all

    render json: @users, status: :ok
  end

  def show
    render json: @current_user, status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { user_id: @user.id }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end

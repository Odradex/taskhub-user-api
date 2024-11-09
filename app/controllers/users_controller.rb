class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])

    render json: @user , status: :ok
  end

  def create
    @user = User.new(user_params)

    Rails.logger.info "user_params: #{user_params.inspect}"
    if @user.save
      render json: { user_id: @user.id }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end

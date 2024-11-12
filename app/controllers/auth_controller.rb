class AuthController < ApplicationController
  def register
    @user = User.new(user_params)

    if @user.save
      render json: { user_id: @user.id }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      render(json: { user: UserSerializer.new(@user), tokens: AuthService.generate_tokens(@user) }, status: :ok)
    else
      head :unauthorized
    end
  end

  def refresh_token
  end


  def logout
  end
end

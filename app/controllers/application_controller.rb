class ApplicationController < ActionController::API
  private

  def authenticate_user
    token = request.headers['Authorization']

    return false unless token

    @current_user = AuthService.authenticate(token)
  end

  def authorize_user
    true
  end

  def current_user
    @current_user
  end
end

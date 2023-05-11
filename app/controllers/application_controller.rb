class ApplicationController < ActionController::API
  def ensure_authorized!
    render json: { error: "unauthorized" }, status: :unauthorized if current_user.nil?
  end

  def current_user = @current_user ||= User.find_by_jwt(jwt)

  def jwt
    request.headers[:authorization]&.split&.last
  end

end

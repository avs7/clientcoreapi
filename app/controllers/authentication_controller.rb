class AuthenticationController < ApplicationController
  skip_after_action :authenticate_user
  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JwtToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M")}, status: :ok

    else
      render json: { error: 'unauthorized'}, status: :unauthorized
    end
  end
end

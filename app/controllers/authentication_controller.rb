class AuthenticationController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:email], params[:password])
  end
end

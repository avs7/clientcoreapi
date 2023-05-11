class UsersController < ApplicationController
  before_action :ensure_authorized!, except: %[create]

  def index
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
    else
      render @user.errors
    end
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :email, :password, :organization, :title, :bio)
  end
end

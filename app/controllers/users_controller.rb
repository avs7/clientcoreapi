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

  def update
    @user = current_user
    if @user.update(contact_params)
    else
      render @user.errors
    end
  end

  def destroy
    @user = current_user
    @user.destroy
  end



  private
  def user_params
    params.permit(:first_name, :last_name, :email, :password, :organization, :title, :bio)
  end
end

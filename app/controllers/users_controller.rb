class UsersController < ApplicationController
  before_action :ensure_authorized!

  def index
    @user = current_user
  end
  
end

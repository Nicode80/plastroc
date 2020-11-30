class UsersController < ApplicationController
  def index
    @users = policy_scope(User).all
  end

  def show
    @user = current_user
    @organisations = current_user.organisations
    authorize @user
  end
end

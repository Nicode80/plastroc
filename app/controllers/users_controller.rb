class UsersController < ApplicationController
  def index
    @users = policy_scope(User).all
    @user_position = position_of(current_user)
    @top_50 = User.order(:xp).first(50).reverse
  end

  def show
    @user = current_user
    @organisations = current_user.organisations
    @user_position = position_of(@user)
    authorize @user
  end

  private

  def position_of(user)
    User.order(:xp).reverse.find_index(user) + 1
  end
end

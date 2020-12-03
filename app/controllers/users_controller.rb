class UsersController < ApplicationController
  def index
    @users = policy_scope(User).all
  end

  def show
    @user = current_user
    @organisations = current_user.organisations
    @leaderboard_position = position_of(@user)
    authorize @user
  end

  private

  def position_of(user)
    User.order(:xp).reverse.find_index(user) + 1
  end
end

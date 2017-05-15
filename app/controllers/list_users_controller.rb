class ListUsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    if can? :show, @users
      @users = User.all
      render action: :show
    else
      redirect_to root_url, :alert => 'No tienes acceso!'
    end
  end
end

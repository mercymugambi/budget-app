class UsersController < ApplicationController
  def index
    if user_signed_in?
      @current_user = current_user.name
    end
    @groups = Group.all
  end
end

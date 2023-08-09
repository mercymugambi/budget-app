class UsersController < ApplicationController
    def index
      # Your code to fetch and prepare data goes here
      @users = User.all
    end
  end
  
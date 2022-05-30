class UsersController < ApplicationController

  def show
    @users = Event.all
  end

end
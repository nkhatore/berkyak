class UsersController < ApplicationController
	before_action :authenticate_user!, :except => [:create, :index, :createcomment]

  def show
    @user = current_user
  end

  

end

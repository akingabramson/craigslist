require 'users_controller_module'

class UsersController < ApplicationController
  include UsersControllerModule
  
  def new
    @user = User.new
    p "here"
  end

  def create
    @user = User.new(params[:user])
    success = true 

    begin
      save_errything
      redirect_to root_url
    rescue ActiveRecord::Rollback => e
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end
end

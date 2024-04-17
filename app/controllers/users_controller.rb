# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by(name: user_params[:username])
    @user.credits ||= User::DEFAULT_CREDITS

    if @user.save
      session[:user_id] = @user.id
      session[:user_credits] = @user.credits
      redirect_to dashboard_index_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end

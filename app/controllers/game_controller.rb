# frozen_string_literal: true

class GameController < ApplicationController
  before_action :set_user, only: %i[roll cash_out]

  def roll
    result, credits = SlotMachineService.new(@user.credits).roll
    session[:user_credits] += credits
    if session[:user_credits].negative?
      render json: { error: 'Not Enough Credits!' }, status: :unprocessable_entity
    else
      render json: { result:, credits: session[:user_credits] }, status: :ok
    end
  end

  def cash_out
    @user.credits = session[:user_credits]
    session.delete(:user_id)
    session.delete(:user_credits)
    @user.save
    redirect_to new_user_path
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end
end

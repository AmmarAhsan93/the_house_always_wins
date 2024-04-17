# frozen_string_literal: true

class GameController < ApplicationController
  before_action :set_user, only: %i[roll cash_out]

  def roll
    service = SlotMachineService.new(@user)
    result, won_credits = service.roll
    session[:user_credits] += won_credits
    render json: { result:, credits: session[:user_credits] }, status: :ok
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

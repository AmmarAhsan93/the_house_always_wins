# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    redirect_to new_user_path unless session[:user_id]
  end
end

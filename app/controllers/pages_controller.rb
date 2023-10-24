class PagesController < ApplicationController
  def index
    @user = current_user
  end

  def set_roots
    if current_user
      redirect_to meal_plans_path
    else
      redirect_to user_session_path
    end
  end
end

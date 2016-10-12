class Api::V1::HomeController < ApplicationController
  respond_to :json
  before_action :set_user

  def index
    @jobs = Job.all
    respond_with @jobs
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def set_user
      @user = current_user
    end
  end

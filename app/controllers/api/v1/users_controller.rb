class Api::V1::UsersController < ApplicationController
  respond_to :json
  include ErrorSerializer
  skip_before_action :authenticate, only: [:create, :show]


  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      command = AuthenticateUser.call(params["email"], params["password"])

      if command.success?
        render json: { auth_token: command.result }, status: 200
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    else
      render json: ErrorSerializer.serialize(user.errors), status: 422
    end
  end

  private

    def user_params
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end


end

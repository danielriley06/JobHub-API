class Api::V1::CurrentUserController < ApplicationController

  def show
    render json: current_user, root: "user", adapter: :json
  end
end

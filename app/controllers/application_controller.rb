class ApplicationController < ActionController::API

  respond_to :json

  before_action :authenticate
  attr_reader :current_user

  private

  def authenticate
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end

class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include Knock::Authenticable

  respond_to :json


end

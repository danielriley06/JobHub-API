class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection



  respond_to :json

  

end

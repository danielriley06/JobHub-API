class User < ApplicationRecord
  has_many :jobs

  validates :auth_id, presence: true
  validates :email, presence: true

  def self.from_token_request(request)
    email = request.params["auth"] && request.params["auth"]["email"]
    auth_id = request.params["auth"] && request.params["auth"]["identities"]["user_id"]
    self.create_with(email).find_or_create_by(auth_id)
  end
end

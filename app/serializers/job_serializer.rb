class JobSerializer < ActiveModel::Serializer
  attributes :id, :company, :jobtitle, :url, :phase, :salary, :city, :state, :snippet, :jobkey, :contact_name, :contact_email, :notes, :status, :contact_name, :contact_email

  belongs_to :user, serializer: UserSerializer
end

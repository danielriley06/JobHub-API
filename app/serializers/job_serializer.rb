class JobSerializer < ActiveModel::Serializer
  attributes :id, :company, :title, :url, :phase, :salary, :location, :contact_name, :contact_email, :notes
end

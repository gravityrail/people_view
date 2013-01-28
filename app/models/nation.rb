class Nation < ActiveRecord::Base
  attr_accessible :client_uid, :secret_key, :slug

  has_many :credentials

  def site
    "http://#{slug}.nbuild.local"
  end

  def client
    @client ||= OAuth2::Client.new(client_uid, secret_key, :site => site)
  end
end

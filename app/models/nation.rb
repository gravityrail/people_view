class Nation < ActiveRecord::Base
  attr_accessible :client_uid, :secret_key, :name, :url, :logo
  mount_uploader :logo, LogoUploader

  has_many :credentials

  def client
    @client ||= OAuth2::Client.new(client_uid, secret_key, :site => url)
  end
end

require 'doorkeeper/models/mongoid/revocable'
require 'doorkeeper/models/mongoid/scopes'

module Doorkeeper
  class AccessGrant
    include Mongoid::Document
    include Mongoid::Timestamps
    include Doorkeeper::Models::Mongoid::Revocable
    include Doorkeeper::Models::Mongoid::Scopes

    self.store_in collection: :oauth_access_grants

    field :resource_owner_id, :type => Moped::BSON::ObjectId
    field :application_id, :type => Hash
    field :token, :type => String
    field :expires_in, :type => Integer
    field :redirect_uri, :type => String
    field :revoked_at, :type => Time

    index({ token: 1 }, { unique: true })
  end
end

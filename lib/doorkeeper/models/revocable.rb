module Doorkeeper
  module Models
    module Revocable
      def revoke(clock = Time)
        update_column :revoked_at, clock.now
      end

      def revoked?
        revoked_at.present?
      end
    end
  end
end

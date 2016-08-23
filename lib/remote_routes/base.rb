module RemoteRoutes
  class Base
    class << self
      attr_accessor :root_path

      def root(root_path)
        @root_path = root_path
      end

      def root_path
        @root_path || consul_path
      end

      def route(method_prefix, path)

      end

      def consul_path
        # talk to consul with class-name-derived id
      end
    end
  end
end









module AvvoRoutes
  class Loblaw < RemoteRoutes::Base
    root "/claim_profile"

    route :claim, "claim/:id"
    route :claim_method, "choose_method/:id"
    route :claim_by_email, "claim_by_email/:id"
    route :claim_by_phone, "claim_by_phone/:id"
    route :claim_by_linkedin, "claim_by_linkedin/:id"
    route :claim_by_facebook, "claim_by_facebook/:id"
  end
end

AvvoRoutes::Loblaw.claim_path(@lawyer)        # => claim/1234
AvvoRoutes::Loblaw.claim_url(@lawyer)         # => claim/1234
AvvoRoutes::Loblaw.claim_path(id: @lawyer.id) # => claim/1234
AvvoRoutes::Loblaw.claim_url(id: @lawyer.id)  # => claim/1234
AvvoRoutes::Loblaw.claim_path(id: @lawyer.id) # => claim/1234
AvvoRoutes::Loblaw.claim_url(id: @lawyer.id)  # => claim/1234


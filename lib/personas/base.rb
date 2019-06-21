# frozen_string_literal: true

module Personas
  class Base
    class << self
      def build_from_request(request)
        user = retrieve_user_from_request(request)
        return request.session['persona'] if user_masquerading?(request.session)

        persona = if user
                    descendants.find do |persona_class|
                      persona_class.applies?(user)
                    end
                  else
                    Personas::Other
                  end

        persona.try(:name).try(:downcase)
      end

      def routable_personas
        {}.tap do |mapper|
          descendants.each do |d|
            mapper[d.name.downcase] = d
          end
        end
      end

      def retrieve_user_from_request(request)
        User.find_by(id: warden_user_id(request.session))
      end

      def applies?(_user)
        raise StandardError
      end

      def warden_user_id(session)
        session['warden.user.user.key'].try(:first).try(:first)
      end

      def user_masquerading?(session)
        session[:previous_persona].present?
      end

      def friendly_name
        name.downcase
      end
    end
  end
end

module API
  module V1
    class BaseController < ApplicationController
      before_action :authenticate!

      def current_user
        @current_user ||= AuthenticateRequest.new(request.headers).user
      end

      private

      def authenticate!
        render json: { session: { errors: I18n.t('activerecord.errors.models.session.invalid_token') } }, status: :unauthorized unless current_user
      end
    end
  end
end

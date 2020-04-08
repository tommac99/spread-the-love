# frozen_string_literal: true

module Api
  module V1
    class BaseController < ActionController::API
      include Pundit
      include CurrentUserHelper

      after_action :verify_authorized, except: :index, unless: :skip_pundit? # rubocop:disable Rails/LexicallyScopedActionFilter
      after_action :verify_policy_scoped, only: :index, unless: :skip_pundit? # rubocop:disable Rails/LexicallyScopedActionFilter

      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      private

      def user_not_authorized
        if current_user
          render json: { msg: :forbidden }, status: :forbidden
        else
          render json: { msg: :unauthorized }, status: :unauthorized
        end
      end

      # Please note that the bang below ensures we need an authenticated user
      def pundit_user
        current_user!
      end

      def skip_pundit?
        devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
      end
    end
  end
end

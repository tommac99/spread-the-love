# frozen_string_literal: true

module CurrentUserHelper
  def current_user
    # Guard to make sure we have a session
    return unless session[:current_user_id]

    # Fetch the user
    @current_user ||= User.find_by(id: session[:current_user_id]) # rubocop:disable Rails/HelperInstanceVariable
  end

  def current_user!
    current_user || raise(Pundit::NotAuthorizedError)
  end
end

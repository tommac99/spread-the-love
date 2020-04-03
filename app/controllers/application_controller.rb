class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def show
    record = Record.find_by(attribute: "value")
    if record.present?
      authorize record
    else
      skip_authorization
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end

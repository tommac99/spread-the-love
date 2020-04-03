class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
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
end

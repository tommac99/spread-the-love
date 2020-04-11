class UserContext
  attr_reader :user, :user_id

  def initialize(user, user_id)
   @user = user
   @user_id = user_id
  end
end


class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  protect_from_forgery with: :exception


  def pundit_user
    UserContext.new(current_user, params["user_id"])
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "Not Authorized to make any changes"
    redirect_to(request.referrer || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :email) }
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # after_action :verify_authorized, except: :index
  # after_action :verify_policy_scoped, only: :index

  # def index
  #   @posts = policy_scope(Post)
  #   @publications = policy_scope(publication_class, policy_scope_class: PublicationPolicy::Scope)
  #   @posts = PostPolicy::Scope.new(current_user, Post).resolve
  # end

  # def show
  #   @post = policy_scope(Post).find(params[:id])
  #   @user = authorize User.find(params[:id])
  #   record = Record.find_by(attribute: "value")
  #   if record.present?
  #     authorize record
  #   else
  #     skip_authorization
  #   end
  # end

  # def update
  #   @post = Post.find(params[:id])
  #   authorize @post
  #   if @post.update(post_params)
  #     redirect_to @post
  #   else
  #     render :edit
  #   end
  # end

  # def publish
  #   @post = Post.find(params[:id])
  #   authorize @post, :update?
  #   @post.publish!
  #   redirect_to @post
  # end

  # def create
  #   @publication = find_publication # assume this method returns any model that behaves like a publication
  #   # @publication.class => Post
  #   authorize @publication, policy_class: PublicationPolicy
  #   @publication.publish!
  #   redirect_to @publication
  # end

  # private

  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(request.referrer || root_path)
  # end

  # def user_not_authorized(exception)
  #   policy_name = exception.policy.class.to_s.underscore
  #   flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
  #   redirect_to(request.referrer || root_path)
  #   # en:
  #   # pundit:
  #   #   default: 'You cannot perform this action.'
  #   #   post_policy:
  #   #     update?: 'You cannot edit this post!'
  #   #     create?: 'You cannot create posts!'
  # end

  #   # Multiple error messages per one policy action?

end



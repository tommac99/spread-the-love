class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index



  def show
    @post = policy_scope(Post).find(params[:id])
    @user = authorize User.find(params[:id])
    record = Record.find_by(attribute: "value")
    if record.present?
      authorize record
    else
      skip_authorization
    end
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def publish
    @post = Post.find(params[:id])
    authorize @post, :update?
    @post.publish!
    redirect_to @post
  end

  def create
    @publication = find_publication # assume this method returns any model that behaves like a publication
    # @publication.class => Post
    authorize @publication, policy_class: PublicationPolicy
    @publication.publish!
    redirect_to @publication
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || root_path)
    # en:
    # pundit:
    #   default: 'You cannot perform this action.'
    #   post_policy:
    #     update?: 'You cannot edit this post!'
    #     create?: 'You cannot create posts!'
  end
end



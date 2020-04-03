class PostPolicy < ApplicationPolicy

  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def permitted_attributes_for_create
    [:title, :body]
  end

  def permitted_attributes_for_edit
    [:body]
  end

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  private

  attr_reader :user, :scope

  def update?
    user.admin? or not post.published?
    # user.admin? or not record.published?
  end

end







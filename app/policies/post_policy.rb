class PostPolicy < ApplicationPolicy

  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
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

  # Multiple error messages per one policy action?

  private

  attr_reader :user, :scope

  def update?
    user.admin? or not post.published?
    # user.admin? or not record.published?
  end

end







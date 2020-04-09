 class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: @user.try(:id))
    end
  end

  def index?
    return true
  end

  def new?
    return true
  end

  def create?
    user_is_owner_of_record?
  end

  def show?
    return true
  end

  def update?
    user_is_owner_of_record?
  end

  def destroy?
    user_is_owner_of_record?
  end


  def dashboard?
    user.user_id.to_i == user.user.id
  end

  private

  def user_is_owner_of_record?
    user.present? && user.user.id == record.user_id
  end
end






class RestaurantPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      # Anyone can see all the restaurants	(AIRBNB Approach)
      scope.all

      # Display only restaurants of the owner
      # scope.where(user: user)
    end
  end

  def show?
  	true
  end

  def create?
  	return true
  end

  def update?
  	is_restaurant_owner_or_admin?
  end

  def destroy?
  	is_restaurant_owner_or_admin?
  end

  private

  def is_restaurant_owner_or_admin?
  	record.user == user || user.admin
  end
end

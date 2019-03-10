class UserObjectPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    owned
  end

  def create?
    true
  end

  def new?
    create?
  end

  def edit?
    owned
  end

  def update?
    edit?
  end

  def destroy?
    owned
  end
end

class FarmPolicy < ApplicationPolicy
  def new?
    !user.farm.present?
  end

  def create?
    !user.farm.present?
  end

  def show?
    record.user == user
  end
end

# frozen_string_literal: true

class CriteriaPolicy < ApplicationPolicy
  def create?
    @record.user == @user
  end

  def update?
    @record.user == @user
  end

  def destroy?
    @record.user == @user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end

# frozen_string_literal: true

class BallisticCalculatorPolicy < ApplicationPolicy
  def new?
    true
  end
  def create?
    true
  end
end

# frozen_string_literal: true

class ShootingGroupPolicy < UserObjectPolicy
  def clone?
    owned
  end
end

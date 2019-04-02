class ShootingGroupPolicy < UserObjectPolicy
  def clone?
    owned
  end
end

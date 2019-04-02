class LoadPolicy < UserObjectPolicy
  def calculate_velocity?
    owned
  end

  def clone?
    owned
  end
end

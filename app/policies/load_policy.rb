class LoadPolicy < UserObjectPolicy
  def calculate_velocity?
    owned
  end
end

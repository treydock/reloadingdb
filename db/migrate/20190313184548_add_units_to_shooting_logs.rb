class AddUnitsToShootingLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :shooting_logs, :temperature_unit, :string
    add_column :shooting_logs, :pressure_unit, :string
    add_column :shooting_logs, :wind_speed_unit, :string
  end
end

class AddCaliberToShootingLogsAndShootingGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :shooting_logs, :caliber, foreign_key: true
    add_reference :shooting_groups, :caliber, foreign_key: true
  end
end

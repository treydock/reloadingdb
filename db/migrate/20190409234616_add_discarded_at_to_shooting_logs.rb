class AddDiscardedAtToShootingLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :shooting_logs, :discarded_at, :datetime
    add_index :shooting_logs, :discarded_at
  end
end

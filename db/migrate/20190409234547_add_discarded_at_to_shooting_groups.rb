class AddDiscardedAtToShootingGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :shooting_groups, :discarded_at, :datetime
    add_index :shooting_groups, :discarded_at
  end
end

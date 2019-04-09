class AddDiscardedAtToGuns < ActiveRecord::Migration[5.2]
  def change
    add_column :guns, :discarded_at, :datetime
    add_index :guns, :discarded_at
  end
end

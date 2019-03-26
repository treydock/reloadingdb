class CreateGuns < ActiveRecord::Migration[5.2]
  def change
    create_table :guns do |t|
      t.string :name
      t.float :sight_height
      t.string :sight_height_unit
      t.integer :zero_range
      t.belongs_to :user, foreign_key: true
      t.belongs_to :caliber, foreign_key: true

      t.timestamps
    end
  end
end

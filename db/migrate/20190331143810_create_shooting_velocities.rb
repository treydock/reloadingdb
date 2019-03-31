class CreateShootingVelocities < ActiveRecord::Migration[5.2]
  def change
    create_table :shooting_velocities do |t|
      t.date :date
      t.text :velocities
      t.belongs_to :user, foreign_key: true
      t.belongs_to :caliber, foreign_key: true
      t.belongs_to :load, foreign_key: true

      t.timestamps
    end
  end
end

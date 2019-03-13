class CreateShootingLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :shooting_logs do |t|
      t.date :date
      t.time :time
      t.belongs_to :shooting_location, foreign_key: true
      t.integer :temperature
      t.float :pressure
      t.integer :angle
      t.text :conditions
      t.integer :humidity
      t.integer :wind_speed
      t.integer :wind_direction
      t.text :notes
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :loads do |t|
      t.belongs_to :caliber, foreign_key: true
      t.belongs_to :brass, foreign_key: true
      t.string :brass_length
      t.date :date
      t.belongs_to :user, foreign_key: true
      t.belongs_to :bullet, foreign_key: true
      t.belongs_to :powder, foreign_key: true
      t.string :powder_weight
      t.belongs_to :primer, foreign_key: true
      t.string :col
      t.string :speed

      t.timestamps
    end
  end
end

class CreateBrasses < ActiveRecord::Migration[5.2]
  def change
    create_table :brasses do |t|
      t.string :name
      t.belongs_to :caliber, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

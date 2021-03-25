class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end

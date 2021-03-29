class ChangeDescriptionToBeTextInSpots < ActiveRecord::Migration[6.0]
  def up
    change_column :spots, :description, :text
  end

  def down
    change_column :spots, :description, :string
  end
end

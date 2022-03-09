class RemoveResultantFromMeutations < ActiveRecord::Migration[7.0]
  def change
    remove_column :meutations, :resultant, :string
  end
end

class RemoveTypeFromMeutations < ActiveRecord::Migration[7.0]
  def change
    remove_column :meutations, :type, :string
  end
end

class RemoveDetailedMutationsFromMeutations < ActiveRecord::Migration[7.0]
  def change
    remove_column :meutations, :detailedMutations, :string
  end
end

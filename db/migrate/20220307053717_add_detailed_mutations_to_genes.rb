class AddDetailedMutationsToGenes < ActiveRecord::Migration[7.0]
  def change
    add_column :genes, :detailedMutations, :string
  end
end

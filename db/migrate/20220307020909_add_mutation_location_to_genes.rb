class AddMutationLocationToGenes < ActiveRecord::Migration[7.0]
  def change
    add_column :genes, :mutationLocation, :string
  end
end

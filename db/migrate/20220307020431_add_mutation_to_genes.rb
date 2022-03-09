class AddMutationToGenes < ActiveRecord::Migration[7.0]
  def change
    add_column :genes, :mutation, :string
  end
end

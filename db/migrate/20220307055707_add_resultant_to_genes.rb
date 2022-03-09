class AddResultantToGenes < ActiveRecord::Migration[7.0]
  def change
    add_column :genes, :resultant, :string
  end
end

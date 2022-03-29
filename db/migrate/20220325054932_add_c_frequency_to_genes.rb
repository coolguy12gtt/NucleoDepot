class AddCFrequencyToGenes < ActiveRecord::Migration[7.0]
  def change
    add_column :genes, :cFrequency, :string
  end
end

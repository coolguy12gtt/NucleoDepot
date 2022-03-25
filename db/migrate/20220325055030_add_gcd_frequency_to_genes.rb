class AddGcdFrequencyToGenes < ActiveRecord::Migration[7.0]
  def change
    add_column :genes, :gdcFrequency, :string
  end
end

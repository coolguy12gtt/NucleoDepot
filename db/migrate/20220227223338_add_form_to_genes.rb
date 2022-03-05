class AddFormToGenes < ActiveRecord::Migration[7.0]
  def change
    add_column :genes, :form, :string
  end
end

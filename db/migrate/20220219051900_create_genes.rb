class CreateGenes < ActiveRecord::Migration[7.0]
  def change
    create_table :genes do |t|
      t.string :form
      t.string :identity
      t.string :name
      t.string :mutation
      t.string :mutationLocation
      t.string :detailedMutations
      t.string :resultant

      t.text :information

      t.timestamps
    end
  end
end

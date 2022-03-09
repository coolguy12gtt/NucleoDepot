class CreateGenes < ActiveRecord::Migration[7.0]
  def change
    create_table :genes do |t|
      t.string :identity
      t.string :name

      t.text :information

      t.timestamps
    end
  end
end

class CreateDrugs < ActiveRecord::Migration[7.0]
  def change
    create_table :drugs do |t|
      t.string :gene
      t.string :source
      t.string :drug

      t.timestamps
    end
  end
end

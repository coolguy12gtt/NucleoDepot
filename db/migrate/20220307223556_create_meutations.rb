class CreateMeutations < ActiveRecord::Migration[7.0]
  def change
    create_table :meutations do |t|
      t.string :form
      t.string :identity
      t.string :location
      t.string :kind
      t.string :subtype
      t.string :resultant

      t.timestamps
    end
  end
end

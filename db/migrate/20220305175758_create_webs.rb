class CreateWebs < ActiveRecord::Migration[7.0]
  def change
    create_table :webs do |t|
      t.string :link
      t.text :information  #might have to do something extra to migrate this
      t.string :form

      t.timestamps
    end
  end
end

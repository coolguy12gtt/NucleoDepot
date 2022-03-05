class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :form
      t.string :link

      t.timestamps
    end
  end
end

class AddKindToMeutations < ActiveRecord::Migration[7.0]
  def change
    add_column :meutations, :kind, :string
  end
end

class AddLinkToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :link, :string
  end
end

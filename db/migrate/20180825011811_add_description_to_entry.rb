class AddDescriptionToEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :description, :string
  end
end

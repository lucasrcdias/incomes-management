class AddAddedAtToEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :added_at, :datetime
  end
end

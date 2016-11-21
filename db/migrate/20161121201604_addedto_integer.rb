class AddedtoInteger < ActiveRecord::Migration
  def change
    remove_column :songlists, :added
    add_column :songlists, :added, :integer, :default => '1'
  end
end

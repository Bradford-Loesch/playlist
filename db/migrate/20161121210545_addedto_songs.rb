class AddedtoSongs < ActiveRecord::Migration
  def change
    add_column :songs, :added, :integer, :default => '0'
  end
end

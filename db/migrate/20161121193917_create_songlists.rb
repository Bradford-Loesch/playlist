class CreateSonglists < ActiveRecord::Migration
  def change
    create_table :songlists do |t|
      t.string :added
      t.references :user, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

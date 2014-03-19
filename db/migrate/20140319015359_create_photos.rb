class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :proj_id
      t.string :filename
      t.datetime :timestamp

      t.timestamps
    end
  end
end

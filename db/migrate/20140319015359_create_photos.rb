class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :filename

      t.timestamps
    end
  end
end

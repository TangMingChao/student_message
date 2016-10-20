class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.attachment :content

      t.timestamps
    end
  end
end

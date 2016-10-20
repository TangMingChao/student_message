class CreateStudentsForums < ActiveRecord::Migration[5.0]
  def change
    create_table :students_forums do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

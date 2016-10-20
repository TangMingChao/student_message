class CreateStudentsInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :students_infos do |t|
      t.string :name
      t.string :sex
      t.integer :number
      t.string :phone
      t.attachment :avatar
      t.integer :age
      t.string :email
      t.string :qq
      t.string :address
      t.string :sign
      

      t.timestamps
    end
  end
end

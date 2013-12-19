class CreateListers < ActiveRecord::Migration
  def change
    create_table :listers do |t|
      t.string :name
      t.string :email
      t.string :hashed_password

      t.timestamps
    end
  end
end

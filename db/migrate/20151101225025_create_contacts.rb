class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :string
      t.string :lname
      t.text :description
      t.string :cell_phone
      t.string :email
      t.string :company
      t.datetime :first_met

      t.timestamps null: false
    end
  end
end

class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :address
      t.numeric :phone
      t.string :injury
      t.string :observations
      t.string :doctor

      t.timestamps
    end
  end
end

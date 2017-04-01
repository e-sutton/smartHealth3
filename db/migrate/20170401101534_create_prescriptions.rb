class CreatePrescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptions do |t|
      t.string :firstname
      t.string :lastname
      t.decimal :cost
      t.string :doctorname
      t.string :medicine
      t.string :dose
      t.string :description
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :id_number

      t.timestamps
    end
  end
end

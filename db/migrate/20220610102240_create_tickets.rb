class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :code
      t.belongs_to :booking, null: false, foreign_key: true
      t.integer :status, default: 0
      t.decimal :price, precision: 5, scale: 2
      t.boolean :extra_luggage, default: false

      t.timestamps
    end
  end
end

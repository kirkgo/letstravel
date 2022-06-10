class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :cardholder
      t.string :number
      t.string :expire_date
      t.string :cvv

      t.timestamps
    end
  end
end

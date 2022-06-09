class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.belongs_to :bus, foreign_key: { to_table: :buses }, index: true, null: false
      t.belongs_to :departure, foreign_key: { to_table: :cities }, index: true, null: false
      t.belongs_to :arrival, foreign_key: { to_table: :cities }, index: true, null: false
      t.datetime :departure_date

      t.timestamps
    end
  end
end

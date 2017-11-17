class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.references :to_airport
      t.references :from_airport
      t.datetime :departure
      t.float :duration

      t.timestamps
    end
  end
end

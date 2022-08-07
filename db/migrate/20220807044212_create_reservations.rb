class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :startday
      t.date :endday
      t.integer :totalday
      t.integer :people
      t.integer :totalprice

      t.timestamps
    end
  end
end

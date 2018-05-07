class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
    	t.date :start_date
    	t.date :end_date
    	t.integer :num_guest
    	t.belongs_to :user
    	t.belongs_to :listing

    	t.timestamps null: false
    end
  end
end

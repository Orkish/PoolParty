class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :date, :null => false
      t.string :time, :null => false
      t.string :location, :null => false
      t.string :destination, :null => false
      t.integer :spaces, :null => false
      t.text :info
      t.belongs_to :users

      t.timestamps
    end
  end
end

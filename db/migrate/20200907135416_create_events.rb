class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :event_date
      t.text :event_description
      t.string :event_location
      t.string :event_name

      t.timestamps
    end
  end
end

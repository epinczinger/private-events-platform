class AddFieldsToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_creator, :integer
  end
end

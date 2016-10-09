class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.datetime :event_at

      t.timestamps
    end
  end
end

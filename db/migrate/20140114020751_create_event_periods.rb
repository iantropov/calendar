class CreateEventPeriods < ActiveRecord::Migration
  def change
    create_table :event_periods do |t|
      t.string  :name
      t.integer :days,   :default => 0
      t.integer :months, :default => 0
      t.integer :years,  :default => 0
    end
  end
end
